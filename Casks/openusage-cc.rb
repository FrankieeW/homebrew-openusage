cask "openusage-cc" do
  version "1.0.7"
  sha256 "2b4f138b28eeccb1d76c2dd608f2a32d7c31a2c2b8a7e9a9c9d38f8a1ae47515"

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
