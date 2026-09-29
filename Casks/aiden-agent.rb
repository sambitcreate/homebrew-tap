cask "aiden-agent" do
  version "0.51.0"
  sha256 "16cb00ac361b92eada64d07cc30f42571e47ceb9730ef1d4439ab4d6d2d9e5d0"

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
