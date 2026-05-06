cask "goojira" do
  version "0.1.2"
  sha256 "099afa609e2846781b93c5ee062c2ab2a9c7d21dc590e213250003fc73fe9fa5"

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
    Clear it after install:

      xattr -cr /Applications/goojira.app

    Or set HOMEBREW_CASK_OPTS="--no-quarantine" in your shell to skip
    the post-install step. Code signing + notarization are on the roadmap.
  EOS
end
