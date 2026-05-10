# TEN Framework - TMAN Homebrew Formula
# This formula installs the TEN Framework package manager (tman)

class Tman < Formula
  desc "TEN Framework package manager and development tool"
  homepage "https://www.theten.ai/"
  version "0.11.65"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/TEN-framework/ten-framework/releases/download/#{version}/tman-mac-release-x64.zip"
      sha256 "0aaf2d9b2d045d23eea5d19967a2802fa4575c6479a7f495298e96b19d5a5fc0"
    elsif Hardware::CPU.arm?
      url "https://github.com/TEN-framework/ten-framework/releases/download/#{version}/tman-mac-release-arm64.zip"
      sha256 "f763793fcb359cc5d223adcc66e4e7b265c36f0e9a0ad3c26dd7bc9b58f4b1d6"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/TEN-framework/ten-framework/releases/download/#{version}/tman-linux-release-x64.zip"
      sha256 "d93911feac1e21d39efe94ef18645142a01d2c9bee4768a85e7720772a1ec6cd"
    elsif Hardware::CPU.arm?
      url "https://github.com/TEN-framework/ten-framework/releases/download/#{version}/tman-linux-release-arm64.zip"
      sha256 "5583b795b8b8e74660d0389a35766c9f1eaf28b33b3d5527ebdbbbe72fd7b2d5"
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
