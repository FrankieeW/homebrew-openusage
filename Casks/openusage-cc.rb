cask "openusage-cc" do
  version "1.0.6"
  sha256 "2a0b69582007ba1749c51d810c1513c4208e7d8a434bc3126c63cba1d455c4c9"

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
