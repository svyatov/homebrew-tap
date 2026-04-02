cask "oz" do
  version "0.1.0"

  on_intel do
    sha256 "aeba0d67786268e8bdc83a671df271da6401277d4fb3c6bd8648d82c9e002d97"
    url "https://github.com/svyatov/oz/releases/download/v#{version}/oz_#{version}_darwin_amd64.tar.gz"
  end

  on_arm do
    sha256 "e496274e74c661a7f20d55fd3420794b01c58bf73a410d31be046b1fe631c5b4"
    url "https://github.com/svyatov/oz/releases/download/v#{version}/oz_#{version}_darwin_arm64.tar.gz"
  end

  name "oz"
  desc "Config-driven CLI wizard framework"
  homepage "https://github.com/svyatov/oz"

  binary "oz"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/oz"]
  end
end
