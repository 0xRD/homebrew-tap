cask "forhunt-viewer" do
  version "0.5.1"
  sha256 "51fb6e516f01e082b49609da6708e7b87e2b501f9193a68743aa21d2b5c109e0"

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
