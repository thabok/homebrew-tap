cask "carpool-planner" do
  version "1.0.3"
  sha256 "a1677853dc1d7765d3d19ca7814b1df703297e9ae7caed4788734da1755d57d8"

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
