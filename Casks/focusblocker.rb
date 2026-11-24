cask "focusblocker" do
  version "1.2.0"
  sha256 "37cc295788a439107b42fc107c5a8f1cc036adafc508dcaa6b583151fe96763d"

  url "https://github.com/elmastahsin/focusblocker/releases/download/v#{version}/FocusBlocker.app.zip"
  name "FocusBlocker"
  desc "Menu bar app that blocks distracting websites and apps for a set time"
  homepage "https://github.com/elmastahsin/focusblocker"

  auto_updates true
  depends_on macos: :ventura

  app "FocusBlocker.app"

  uninstall quit:      "app.focusblocker.app",
            launchctl: "app.focusblocker.daemon"

  zap trash: [
    "/Library/Application Support/FocusBlocker",
    "~/Library/Preferences/app.focusblocker.app.plist",
  ]

  caveats <<~EOS
    FocusBlocker installs a background daemon. Approve it in
    System Settings > General > Login Items & Extensions on first launch.

    Uninstall only after the active block has ended. Otherwise the
    FOCUSBLOCKER entries stay in /etc/hosts.
  EOS
end
