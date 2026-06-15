cask "openusage-cc" do
  version "0.6.28"
  sha256 "f869ae56a0f589a4e81624c5f6292f91e649c0e45f3e77ebabef72e457dbbc3b"

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
