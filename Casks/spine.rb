cask "spine" do
  version "0.1.1"
  sha256 "0d694a056be080ffc36c6a513d120a57029df024cc0dbe546b71a146d33cd6ac"

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
