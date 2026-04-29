# homebrew-goojira

Homebrew tap for [goojira](https://github.com/roeezolantz/goojira) — a lean cross-platform menubar/tray companion for Jira.

## Install

```bash
brew install --cask --no-quarantine roeezolantz/goojira/goojira
```

The `--no-quarantine` flag is required because pre-1.0 builds aren't yet code-signed. Without it, macOS will refuse to launch the app with a *"goojira is damaged"* error.

If you forget the flag, you can fix it after install:

```bash
xattr -cr /Applications/goojira.app
```

## Update

```bash
brew upgrade --cask goojira
```

The app also auto-updates from GitHub Releases via `update-electron-app` once it's running.

## Uninstall

```bash
brew uninstall --cask goojira
brew uninstall --cask --zap goojira    # also removes settings + cached token
```

## Requirements

- macOS Ventura (13) or later.
- Apple Silicon (arm64). An Intel build is on the goojira roadmap.

## License

The tap formula is MIT-licensed. goojira itself is also MIT — see the [main repo](https://github.com/roeezolantz/goojira).
