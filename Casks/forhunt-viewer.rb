cask "forhunt-viewer" do
  version "0.5.3"
  sha256 "7e34bd747ba30ac62a7ad8280df17221e3f5c31f800c5c2d93c12bbdedac1c32"

  url "https://github.com/0xRD/forhunt-viewer/releases/download/v#{version}/forhunt-viewer-#{version}-macos-arm64.dmg"
  name "forhunt-viewer"
  desc "Fast timeline and CSV viewer for forensic analysts"
  homepage "https://github.com/0xRD/forhunt-viewer"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :big_sur

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
