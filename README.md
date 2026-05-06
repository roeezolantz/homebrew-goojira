# homebrew-goojira

Homebrew tap for [goojira](https://github.com/roeezolantz/goojira) — a lean cross-platform menubar/tray companion for Jira.

## Install

```bash
brew install --cask roeezolantz/goojira/goojira
xattr -cr /Applications/goojira.app
```

The `xattr -cr` step is required because pre-1.0 builds aren't yet code-signed; without it macOS rejects the app with *"goojira is damaged and can't be opened"*. The command strips the quarantine flag Homebrew applies on install.

Modern Homebrew (5.x) removed the per-install `--no-quarantine` flag. If you'd rather skip the post-install command, set the env var globally:

```bash
export HOMEBREW_CASK_OPTS="--no-quarantine"
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
