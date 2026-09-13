cask "carpool-planner" do
  version "1.0.0"
  sha256 "4ffe06c270d787d31f6cf17a274ecec43df43c08018f0f3f640b1ffcd05ef6aa"

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
