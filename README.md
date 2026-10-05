# 0xRD's Homebrew tap

Apps and tools by [0xRD](https://github.com/0xRD), installable with [Homebrew](https://brew.sh).

```sh
brew install --cask 0xrd/tap/hector
```

| Name | Kind | What it is |
|---|---|---|
| [hector](Casks/hector.rb) | app | [Hector](https://github.com/0xRD/hector): see what runs on your Mac, what starts by itself and who it talks to, then block it. Also installs the `hector` command. |

Update with `brew update && brew upgrade`.

These apps are not notarized by Apple (no paid developer account), so macOS asks you to allow them once: System Settings → Privacy & Security → Open Anyway. Each release's SHA-256 is pinned in its cask and checked by Homebrew.

The casks are updated automatically by each project's release workflow.
