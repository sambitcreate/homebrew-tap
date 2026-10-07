cask "aiden-agent" do
  version "0.54.0"
  sha256 "8383568a9f27b0d4744a1da4e8df66d7abaffdeb6a2bcea035d780540ca6e908"

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
