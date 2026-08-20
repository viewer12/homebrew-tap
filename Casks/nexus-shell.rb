cask "nexus-shell" do
  version "1.7.1"
  sha256 "6a5c975f6e556740c66ed8615fea3c5dffd30f767605840cee520c9ba92f4040"

  url "https://releases.nexusshell.app/Nexus-Shell-v#{version}.dmg"
  name "Nexus Shell"
  desc "SwiftUI SSH client with terminal, SFTP, Docker and key management"
  homepage "https://nexusshell.app/"

  livecheck do
    url "https://nexusshell.app/releases/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Nexus Shell.app"

  uninstall quit: "sameral.Nexus-Shell"

  # Only the Developer ID build's paths. The `.appstore` / NexusShell-AppStore
  # variants belong to the separate Mac App Store distribution and must not be
  # removed here — a user may have both installed.
  zap trash: [
    "~/Library/Application Scripts/sameral.Nexus-Shell",
    "~/Library/Application Support/Nexus Shell",
    "~/Library/Caches/sameral.Nexus-Shell",
    "~/Library/Containers/sameral.Nexus-Shell",
    "~/Library/HTTPStorages/sameral.Nexus-Shell",
    "~/Library/HTTPStorages/sameral.Nexus-Shell.binarycookies",
    "~/Library/Preferences/sameral.Nexus-Shell.plist",
    "~/Library/Saved Application State/sameral.Nexus-Shell.savedState",
    "~/Library/WebKit/sameral.Nexus-Shell",
  ]
end
