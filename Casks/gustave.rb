cask "gustave" do
  version "0.1.6"
  sha256 "cf210fd4d6d9297ef07cb78701bae6a1f9fc6dec5600d8000636586c3c318446"

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
