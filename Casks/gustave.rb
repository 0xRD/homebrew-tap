cask "gustave" do
  version "0.1.5"
  sha256 "d45d60270682033644d59b6d622ffef9d20f8740898bf4addff60ccbfd311fd6"

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
