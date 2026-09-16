cask "aiden-agent" do
  version "0.41.2"
  sha256 "822327f5b97830dc7db40e6f11e35fec68ced2906a1c81b1b17c060b9ab600a7"

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
