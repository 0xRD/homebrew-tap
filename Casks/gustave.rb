cask "gustave" do
  version "0.1.0"
  sha256 "4dd94a1d1960c1d6f48feb4ad9743c75c460c73d6df4223a22a179bd8ddfbc4b"

  url "https://github.com/0xRD/gustave/releases/download/v#{version}/Gustave-#{version}-macOS.zip"
  name "Gustave"
  desc "Dock window list, Option+Tab window switcher and per-device scroll inversion"
  homepage "https://github.com/0xRD/gustave"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Gustave.app"

  uninstall quit: "io.github.0xrd.gustave"

  zap trash: "~/Library/Preferences/io.github.0xrd.gustave.plist"

  caveats <<~EOS
    Gustave is not notarized by Apple. On first launch macOS blocks it: open
    System Settings > Privacy & Security and click "Open Anyway" next to Gustave.

    Then grant Accessibility when Gustave asks. Releases are signed with the
    same certificate, so the permission carries over to upgrades.

    If "Open at login" is on, turn it off in Gustave before uninstalling.
  EOS
end
