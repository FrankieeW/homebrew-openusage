cask "openusage-cc" do
  version "1.0.1"
  sha256 "1f66943376b6a22159e9159a4cb9053c225b4eab1894e6fd6a803bd8ac4feae4"

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
