cask "hector" do
  version "0.4.8"
  sha256 "a24fb4569e3f7e11e32a73aa422b9c3c1ecd6fc87aab3b48cda09100129513b6"

  url "https://github.com/0xRD/hector/releases/download/v#{version}/Hector-#{version}-macOS.zip"
  name "Hector"
  desc "See what runs, starts by itself and talks to the network, then block it"
  homepage "https://github.com/0xRD/hector"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "Hector.app"
  binary "#{appdir}/Hector.app/Contents/Helpers/hector"

  # Upgrades run this too: only quit the app. The root helper and its rules stay in force across
  # upgrades; they are removed by Hector -> Uninstall Hector... or by `brew uninstall --zap`.
  uninstall quit: "io.github.0xrd.hector"

  zap script: {
        executable:   "/Library/PrivilegedHelperTools/io.github.0xrd.hectord",
        args:         ["uninstall", "--purge"],
        sudo:         true,
        must_succeed: false,
      },
      trash:  [
        "~/Library/Application Support/Hector",
        "~/Library/Caches/io.github.0xrd.hector",
        "~/Library/HTTPStorages/io.github.0xrd.hector",
        "~/Library/HTTPStorages/io.github.0xrd.hector.binarycookies",
        "~/Library/Preferences/io.github.0xrd.hector.plist",
        "~/Library/Saved Application State/io.github.0xrd.hector.savedState",
      ]

  caveats <<~EOS
    Hector is not notarized by Apple. On first launch macOS blocks it: open
    System Settings > Privacy & Security and click "Open Anyway" next to Hector.
    Until then the `hector` command is stopped by macOS too.

    Blocking needs Hector's helper. After each upgrade, open Hector and choose
    Blocklists > Update helper... so the helper matches the app.

    `brew uninstall` leaves the helper and its rules in place. To remove
    everything, use Hector > Uninstall Hector... or `brew uninstall --zap hector`.
  EOS
end
