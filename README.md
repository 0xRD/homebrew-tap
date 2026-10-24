# 0xRD's Homebrew tap

Apps and tools by [0xRD](https://github.com/0xRD), installable with [Homebrew](https://brew.sh).

```sh
brew install --cask 0xrd/tap/hector
brew install 0xrd/tap/forhunt
brew install --cask 0xrd/tap/forhunt-viewer
```

All three need a Mac with Apple silicon (`forhunt` also installs on Linux).

| Name | Kind | What it is |
|---|---|---|
| [hector](Casks/hector.rb) | app | [Hector](https://github.com/0xRD/hector): see what runs on your Mac, what starts by itself and who it talks to, then block it. Also installs the `hector` command. |
| [forhunt-viewer](Casks/forhunt-viewer.rb) | app | [forhunt-viewer](https://github.com/0xRD/forhunt-viewer): opens multi-GB timeline CSVs (forhunt, EvtxECmd, Hayabusa...) instantly, with Excel-style filters, sorting, tagging and export. |
| [forhunt](Formula/forhunt.rb) | command | [Forensic Hunter](https://github.com/0xRD/forensic-hunter): very fast Windows event log (EVTX) and NTFS parsing, search and timelines for DFIR. macOS (Apple Silicon) and Linux. |

Update with `brew update && brew upgrade`.

These apps and tools are not notarized by Apple (no paid developer account), so macOS asks you to allow them once: System Settings → Privacy & Security → Open Anyway. Each release's SHA-256 is pinned in its cask or formula and checked by Homebrew. Command-line formulae are not quarantined, so they run without that step.

The casks and formulae are updated automatically by each project's release workflow.
