class Nomnom < Formula
  desc "AI-powered CLI to rename files with intelligent names"
  homepage "https://github.com/Vein05/nomnom"
  license "MIT"
  version "1.0.1"

  on_macos do
    depends_on "libffi"
    depends_on "mupdf"

    on_arm do
      url "https://github.com/Vein05/nomnom/releases/download/v#{version}/nomnom-darwin-arm64.zip"
      sha256 "6195d498619af16624705cebe4c14f7f7f273c68d33135617d74a03e46776722"
    end
    on_intel do
      url "https://github.com/Vein05/nomnom/releases/download/v#{version}/nomnom-darwin-amd64.zip"
      sha256 "6908caf78adc55867f421d2988373b0eaf54754f1498548797dbaf81ddf3e390"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/Vein05/nomnom/releases/download/v#{version}/nomnom-linux-arm64.zip"
      sha256 "ad6d0c29bced66857fab9b249f380d1889405057a0c4ba48e6695c26d8603d57"
    end
    on_intel do
      url "https://github.com/Vein05/nomnom/releases/download/v#{version}/nomnom-linux-amd64.zip"
      sha256 "f244c2f7b379dd1cafe749f59a3eeab3d22e369f56278a79b50173af34307e34"
    end
  end

  def install
    # libffi is keg-only, so dlopen can't find it by default.
    # mupdf is linked into standard paths, but we include it for safety.
    libffi_path = Formula["libffi"].opt_lib.to_s

    (bin/"nomnom").write <<~SHELL
      #!/bin/sh
      export DYLD_FALLBACK_LIBRARY_PATH="#{libffi_path}:/opt/homebrew/lib:/usr/local/lib"
      exec "#{libexec}/nomnom" "$@"
    SHELL
    (bin/"nomnom").chmod 0755

    libexec.install "nomnom"
  end

  test do
    assert_match "Usage", shell_output("#{bin}/nomnom --help")
  end
end
