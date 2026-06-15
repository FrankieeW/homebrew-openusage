cask "openusage-cc" do
  version "1.0.2"
  sha256 "c3754420b99e07dea040c5c2be18a0c8c9a6a10d0a5af6add0b52e7c4d7392f8"

  url "https://github.com/FrankieeW/openusage/releases/download/v#{version}/OpenUsageCC_#{version}_aarch64.dmg",
      verified: "github.com/FrankieeW/openusage/"
  name "OpenUsage.cc"
  desc "AI subscription tracker — Community Collection"
  homepage "https://github.com/FrankieeW/openusage"

  depends_on macos: :ventura

  app "OpenUsageCC.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/OpenUsageCC.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.sunstory.openusage.cc",
    "~/Library/Logs/com.sunstory.openusage.cc",
  ]
end
