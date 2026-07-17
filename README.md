# Nexus Shell Homebrew tap

Homebrew cask for [Nexus Shell](https://nexusshell.app/) — a SwiftUI macOS SSH
client with terminal, SFTP, Docker, key management and live server monitoring.

## Install

```sh
brew install --cask viewer12/tap/nexus-shell
```

The full `viewer12/tap/...` path taps this repository automatically, so there is
no need to run `brew tap` first. Homebrew may ask you to trust this tap the
first time — it does that for every non-official tap.

## Upgrade

Nexus Shell updates itself via [Sparkle](https://sparkle-project.org/), so the
cask is marked `auto_updates true`. In practice:

- Let the app update itself and Homebrew stays out of the way.
- Ignore the app's update prompts and `brew upgrade` will bring you up to date
  anyway — it compares the installed bundle's version, not just its own records.

## Uninstall

```sh
brew uninstall --cask nexus-shell
```

To also remove preferences and caches:

```sh
brew uninstall --zap --cask nexus-shell
```

`--zap` only touches the Developer ID build's files. If you also have the Mac
App Store build installed, its data is left alone.

## Requirements

- Apple Silicon. The app is arm64-only; Intel Macs are not supported.
- macOS 14.2 or later. Homebrew can only express major versions, so the cask
  requires macOS 14 and the app itself enforces the 14.2 minimum at launch.

## Notes

The cask is bumped automatically by [a scheduled workflow](.github/workflows/bump-cask.yml)
that watches <https://nexusshell.app/releases/latest.json>. The installer is
served from `releases.nexusshell.app`; it is signed with an Apple Developer ID,
notarized, and the notarization ticket is stapled to the disk image.

Issues with the app itself belong in
[Nexus-Shell-Releases](https://github.com/viewer12/Nexus-Shell-Releases/issues).
This repository only carries the cask definition.
