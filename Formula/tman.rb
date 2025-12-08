# TEN Framework - TMAN Homebrew Formula
# This formula installs the TEN Framework package manager (tman)

class Tman < Formula
  desc "TEN Framework package manager and development tool"
  homepage "https://www.theten.ai/"
  version "0.11.41"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/TEN-framework/ten-framework/releases/download/#{version}/tman-mac-release-x64.zip"
      sha256 "a7eede0874497a0c3fab0d9b631ba42769c571650383811ae632174096f96159"
    elsif Hardware::CPU.arm?
      url "https://github.com/TEN-framework/ten-framework/releases/download/#{version}/tman-mac-release-arm64.zip"
      sha256 "f28215170f045b5ecd469e0f36add8fc7b77ee6e10ee95249bb70fac1404b251"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/TEN-framework/ten-framework/releases/download/#{version}/tman-linux-release-x64.zip"
      sha256 "724fb055565df6d0206cfb7fc00ae3c2fff921e2baee18d575fc6071e73fa1de"
    elsif Hardware::CPU.arm?
      url "https://github.com/TEN-framework/ten-framework/releases/download/#{version}/tman-linux-release-arm64.zip"
      sha256 "7ab26922a5438e690d01fcbc6330e3610adccefa00cef0ef3dc6564f8ed60430"
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
