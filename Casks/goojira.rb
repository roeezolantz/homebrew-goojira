cask "goojira" do
  version "0.1.0"
  sha256 "e94c73f9ad5a1f8f5e08cfbc38951af2aeeeec067890c8b6dcfbf9e84e82e0dc"

  url "https://github.com/roeezolantz/goojira/releases/download/v#{version}/goojira-#{version}-arm64.dmg"
  name "goojira"
  desc "Lean cross-platform menubar/tray companion for Jira"
  homepage "https://github.com/roeezolantz/goojira"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :ventura"
  depends_on arch: :arm64

  app "goojira.app"

  zap trash: [
    "~/Library/Application Support/goojira",
    "~/Library/Logs/goojira",
    "~/Library/Preferences/dev.roeezolantz.goojira.plist",
    "~/Library/Saved Application State/dev.roeezolantz.goojira.savedState",
  ]

  caveats <<~EOS
    goojira is not yet code-signed. Homebrew applies a quarantine flag on
    install, which macOS reads as "goojira is damaged and can't be opened".
    Two options:

      1. Install with quarantine disabled (one-off):
           brew install --cask --no-quarantine roeezolantz/goojira/goojira

      2. Or, after a normal install, clear the flag:
           xattr -cr /Applications/goojira.app

    Code signing + notarization are on the roadmap.
  EOS
end
