cask "spine" do
  version "0.1.0"
  sha256 "15e5cff837515a7bb75746bd7406605c673b989ad399b255cc4d98502b053994"

  url "https://github.com/elmastahsin/spine/releases/download/v#{version}/Spine.app.zip"
  name "Spine"
  desc "Menu bar posture tracker using AirPods head motion sensors"
  homepage "https://github.com/elmastahsin/spine"

  depends_on macos: :sonoma

  app "Spine.app"

  caveats <<~EOS
    Spine is ad-hoc signed, not notarized by Apple. On first launch,
    Gatekeeper will refuse to open it normally. Either right-click
    Spine.app in Finder and choose Open, or run:

      xattr -cr /Applications/Spine.app
  EOS

  zap trash: [
    "~/Library/Preferences/com.tahsinelmas..Spine.plist",
  ]
end
