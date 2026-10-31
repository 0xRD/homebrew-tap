cask "forhunt-viewer" do
  version "0.7.0"
  sha256 "c4656b29b0623e7315ed5b111464f58c281314689ee5103656131873983effd5"

  url "https://github.com/0xRD/forhunt-viewer/releases/download/v#{version}/forhunt-viewer-#{version}-macos-arm64.dmg"
  name "forhunt-viewer"
  desc "Fast timeline and CSV viewer for forensic analysts"
  homepage "https://github.com/0xRD/forhunt-viewer"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on :macos

  app "forhunt-viewer.app"

  zap trash: [
    "~/Library/Application Support/forhunt-viewer",
    "~/Library/Caches/forhunt-viewer",
  ]

  caveats <<~EOS
    forhunt-viewer is not notarized by Apple. On first launch macOS blocks it:
    open System Settings > Privacy & Security and click "Open Anyway" next to
    forhunt-viewer.
  EOS
end
