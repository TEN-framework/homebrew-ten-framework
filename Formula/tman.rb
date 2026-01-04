# TEN Framework - TMAN Homebrew Formula
# This formula installs the TEN Framework package manager (tman)

class Tman < Formula
  desc "TEN Framework package manager and development tool"
  homepage "https://www.theten.ai/"
  version "0.11.48"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/TEN-framework/ten-framework/releases/download/#{version}/tman-mac-release-x64.zip"
      sha256 "e899bfe1e6c9ec2dd9f5df590ad7c998b8a74bd3e6b34d0cbebf9816d9db23ae"
    elsif Hardware::CPU.arm?
      url "https://github.com/TEN-framework/ten-framework/releases/download/#{version}/tman-mac-release-arm64.zip"
      sha256 "0ebb8b4f1ca6e2d1dbc060dfdf3954fa0a2bb873f1a101bdb5e696d3c639abc4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/TEN-framework/ten-framework/releases/download/#{version}/tman-linux-release-x64.zip"
      sha256 "2adfc0ebd4f48a5977196374e97c99c8406438ef0a7aa5222bda675806cea6ff"
    elsif Hardware::CPU.arm?
      url "https://github.com/TEN-framework/ten-framework/releases/download/#{version}/tman-linux-release-arm64.zip"
      sha256 "45fe7a534392d451cdd9239cf4852d7156f80b74d36b5b07797165edb6ac403e"
    end
  end

  def install
    # The binary is directly accessible after unzip
    bin.install "bin/tman"
  end

  def caveats
    <<~EOS
      🎉 tman has been installed successfully!

      Common commands:
        tman --version       # Check version
        tman --help          # Show help
        tman install         # Install project dependencies
        tman create <name>   # Create new project

      For more information, visit:
        https://github.com/TEN-framework/ten-framework
    EOS
  end

  test do
    # Test that tman can be executed and returns version info
    assert_match version.to_s, shell_output("#{bin}/tman --version")
  end
end
