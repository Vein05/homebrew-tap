class Nomnom < Formula
  desc "AI-powered CLI to rename files with intelligent names"
  homepage "https://github.com/Vein05/nomnom"
  license "MIT"
  version "1.0.1"

  on_macos do
    on_arm do
      url "https://github.com/Vein05/nomnom/releases/download/v#{version}/nomnom-darwin-arm64.zip"
      sha256 "5bf3ac15bd5772091358b03c9474fec625340069af02bb945651fe29edc94180"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Vein05/nomnom/releases/download/v#{version}/nomnom-linux-arm64.zip"
      sha256 "d32f1fdd022309c6f8bb24914c568e121ff7e190dc7fb8ac140e58c8afbb9722"
    end
    on_intel do
      url "https://github.com/Vein05/nomnom/releases/download/v#{version}/nomnom-linux-amd64.zip"
      sha256 "da7339ce32d08a77664485d0f948b3bbec211dd0ae7791adadf7ccaf0b5c69d4"
    end
  end

  def install
    bin.install "nomnom"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/nomnom --help 2>/dev/null")
  end
end
