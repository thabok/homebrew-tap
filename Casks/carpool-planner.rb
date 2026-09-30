cask "carpool-planner" do
  version "1.0.8"
  sha256 "99d38bafc302ce5242770e031c82ee0b5e3db5f7f15c4b47ab9e9836043fdc2c"

  url "https://github.com/thabok/mycartime/releases/download/v#{version}/CarpoolPlanner_#{version}_aarch64.dmg"
  name "Carpool Planner"
  desc "Desktop app for planning teacher carpools"
  homepage "https://github.com/thabok/mycartime"

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "CarpoolPlanner.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/CarpoolPlanner.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.thabok.mycartime",
    "~/Library/Caches/com.thabok.mycartime",
    "~/Library/Preferences/com.thabok.mycartime.plist",
    "~/Library/Saved Application State/com.thabok.mycartime.savedState",
  ]
end
