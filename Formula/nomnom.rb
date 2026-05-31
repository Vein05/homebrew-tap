class Nomnom < Formula
  desc "AI-powered CLI to rename files with intelligent names"
  homepage "https://github.com/Vein05/nomnom"
  license "MIT"
  version "1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/Vein05/nomnom/releases/download/v#{version}/nomnom-darwin-arm64.zip"
      sha256 "3181f0987f688dbd423a8916c8a2ba9fa57fe7b99c6808dfa64628b77050db6c"
    end
    on_intel do
      url "https://github.com/Vein05/nomnom/releases/download/v#{version}/nomnom-darwin-amd64.zip"
      sha256 "3dfbc4b12dd0423e820359aa7c60aae618d26ae1502352ebd7ce4f8ed41ed101"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Vein05/nomnom/releases/download/v#{version}/nomnom-linux-arm64.zip"
      sha256 "ef7ed7e17f3bf6867c720ab416ce73442643b81051ef564fa34cc3cdf1300387"
    end
    on_intel do
      url "https://github.com/Vein05/nomnom/releases/download/v#{version}/nomnom-linux-amd64.zip"
      sha256 "3c001e9fb517aab85e54dc83da5a4aa0b932bb3cd441b025c188dd9235e71ce7"
    end
  end

  def install
    bin.install "nomnom"
  end

  test do
    assert_match "nomnom", shell_output("#{bin}/nomnom version")
  end
end
