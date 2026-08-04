class Notekit < Formula
  desc "Apple Notes data pipeline CLI for AI agents"
  homepage "https://github.com/hiauhong/notekit-cli"
  version "0.1.2"
  license "MIT"

  on_arm do
    url "https://github.com/hiauhong/notekit-cli/releases/download/v0.1.2/notekit-darwin-arm64.tar.gz"
    sha256 "7eb0613a6e4cc6f232f7710688dd3b67e4d8f12f2c0be2d764b0e894eaeddbc5"
  end

  on_intel do
    def install
      odie "notekit-cli does not publish x86_64 binaries yet; build from source instead."
    end
  end

  def install
    bin.install "notekit"
    # agent skill: installed for manual copy to ~/.agents/skills
    (share/"notekit/skills").install ".agents/skills/notekit"
  end

  test do
    system "#{bin}/notekit", "--help"
  end
end
