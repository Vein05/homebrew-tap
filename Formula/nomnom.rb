class Nomnom < Formula
  desc "AI-powered CLI to rename files with intelligent names"
  homepage "https://github.com/Vein05/nomnom"
  license "MIT"
  version "1.0.0"

  on_macos do
    depends_on "libffi"
    depends_on "mupdf"

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
    libffi_path = Formula["libffi"].opt_lib.to_s

    (bin/"nomnom").write <<~SHELL
      #!/bin/sh
      export DYLD_FALLBACK_LIBRARY_PATH="#{libffi_path}:/opt/homebrew/lib:/usr/local/lib"
      exec "#{libexec}/nomnom" "$@"
    SHELL
    (bin/"nomnom").chmod 0755

    libexec.install "nomnom"
  end

  def caveats
    <<~EOS
      PDF/DOCX support requires MuPDF 1.24.x. Homebrew's current mupdf is newer
      and incompatible, so PDF processing will show warnings on stderr. All other
      file types work normally. This will be fixed in the next release.
    EOS
  end

  test do
    assert_match "Usage", shell_output("#{bin}/nomnom --help 2>/dev/null")
  end
end
