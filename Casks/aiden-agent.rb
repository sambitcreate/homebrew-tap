cask "aiden-agent" do
  version "0.27.26"
  sha256 "18a466bf32b46763883a9083c0b35e144384a9035fc2063d3c7b4c0b6a01575e"

  url "https://github.com/sambitcreate/aiden-agent/releases/download/v#{version}/Aiden.Agent.Beta-#{version}-arm64.dmg"
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
