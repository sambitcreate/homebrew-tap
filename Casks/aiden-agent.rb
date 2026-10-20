cask "aiden-agent" do
  version "0.59.0"
  sha256 "3c04ae3fcd09781f8cb6cfa37671db0b4effb205bedb9553956f413e679b85a1"

  url "https://github.com/sambitcreate/aiden-agent/releases/download/v#{version}/Aiden-Agent-Beta-#{version}-arm64.dmg"
  name "Aiden Agent"
  desc "AI workspace agent for local and hosted models"
  homepage "https://github.com/sambitcreate/aiden-agent"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :monterey

  app "Aiden Agent.app"
end
