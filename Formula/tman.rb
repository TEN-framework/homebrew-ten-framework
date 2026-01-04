# TEN Framework - TMAN Homebrew Formula
# This formula installs the TEN Framework package manager (tman)

class Tman < Formula
  desc "TEN Framework package manager and development tool"
  homepage "https://www.theten.ai/"
  version "0.11.49"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/TEN-framework/ten-framework/releases/download/#{version}/tman-mac-release-x64.zip"
      sha256 "bf1ca88a7948e3c80790319defb4860ab10729035cb56c53cbe8f313a658fc36"
    elsif Hardware::CPU.arm?
      url "https://github.com/TEN-framework/ten-framework/releases/download/#{version}/tman-mac-release-arm64.zip"
      sha256 "62aaa2af909b71cdba79225bbb05d34aa039fd3a1bbad0a4bf7530acfdff7e0d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/TEN-framework/ten-framework/releases/download/#{version}/tman-linux-release-x64.zip"
      sha256 "c8a14e7ce8a7e5816d036161c24550de91ef17ded692af80dd46db0cf9aacdf5"
    elsif Hardware::CPU.arm?
      url "https://github.com/TEN-framework/ten-framework/releases/download/#{version}/tman-linux-release-arm64.zip"
      sha256 "974eeda4c56bc6828c353f63258bf8e02e4c641e9b5426978c2946de31550276"
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
