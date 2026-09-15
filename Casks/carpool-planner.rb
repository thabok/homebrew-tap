cask "carpool-planner" do
  version "1.0.1"
  sha256 "de5ec25f42e597cd8aac0f554988fff43d6609563f803e368e9634e5136d80e1"

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
