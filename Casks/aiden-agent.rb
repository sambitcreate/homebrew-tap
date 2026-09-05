cask "aiden-agent" do
  version "0.38.1"
  sha256 "11122f80541f57c387aa9fbe67641512e2f8a65d754389e5f1ab3a3ca24548ca"

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
