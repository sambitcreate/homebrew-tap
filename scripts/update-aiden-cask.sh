#!/bin/bash

set -euo pipefail

repository="${AIDEN_REPOSITORY:-sambitcreate/aiden-agent}"
cask_path="${AIDEN_CASK_PATH:-Casks/aiden-agent.rb}"

for command in gh curl ruby shasum; do
  if ! command -v "$command" >/dev/null 2>&1; then
    echo "Required command is unavailable: $command" >&2
    exit 1
  fi
done

if [[ ! -f "$cask_path" ]]; then
  echo "Aiden cask is unavailable: $cask_path" >&2
  exit 1
fi

release_json="$(gh api "repos/${repository}/releases/latest")"
tag="$(ruby -rjson -e 'puts JSON.parse(STDIN.read).fetch("tag_name")' <<<"$release_json")"
if [[ ! "$tag" =~ ^v([0-9]+\.[0-9]+\.[0-9]+)$ ]]; then
  echo "Latest Aiden release tag is not a stable semantic version: $tag" >&2
  exit 1
fi
version="${BASH_REMATCH[1]}"
asset_name="Aiden.Agent.Beta-${version}-arm64.dmg"
asset_url="$(
  ASSET_NAME="$asset_name" ruby -rjson -e '
    release = JSON.parse(STDIN.read)
    matches = release.fetch("assets").select { |asset| asset["name"] == ENV.fetch("ASSET_NAME") }
    abort "Expected exactly one Aiden DMG asset" unless matches.length == 1
    puts matches.fetch(0).fetch("browser_download_url")
  ' <<<"$release_json"
)"

current_version="$(
  ruby -e '
    match = File.read(ARGV.fetch(0)).match(/^\s*version "([^"]+)"$/)
    abort "Could not read the current cask version" unless match
    puts match[1]
  ' "$cask_path"
)"
if [[ "$current_version" == "$version" ]]; then
  echo "Aiden cask is already current at ${version}."
  exit 0
fi

download_dir="$(mktemp -d)"
dmg_path="${download_dir}/${asset_name}"
cleanup() {
  rm -f "$dmg_path"
  rmdir "$download_dir" 2>/dev/null || true
}
trap cleanup EXIT

curl --fail --location --retry 3 --output "$dmg_path" "$asset_url"
sha256="$(shasum -a 256 "$dmg_path" | awk '{ print $1 }')"
if [[ ! "$sha256" =~ ^[0-9a-f]{64}$ ]]; then
  echo "Downloaded Aiden DMG did not produce a SHA-256 checksum." >&2
  exit 1
fi

ruby - "$cask_path" "$version" "$sha256" <<'RUBY'
path, version, sha256 = ARGV
source = File.read(path)
updated = source.sub(/^(\s*)version "[^"]+"$/, "\\1version \"#{version}\"")
abort "Expected exactly one version stanza" if updated == source
source = updated
updated = source.sub(/^(\s*)sha256 "[0-9a-f]{64}"$/, "\\1sha256 \"#{sha256}\"")
abort "Expected exactly one SHA-256 stanza" if updated == source
File.write(path, updated)
RUBY

echo "Updated Aiden cask to ${version} (${sha256})."
