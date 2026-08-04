class Notekit < Formula
  desc "Apple Notes data pipeline CLI for AI agents"
  homepage "https://github.com/hiauhong/notekit-cli"
  version "0.1.0"
  license "MIT"

  on_arm do
    url "https://github.com/hiauhong/notekit-cli/releases/download/v0.1.0/notekit-darwin-arm64.tar.gz"
    sha256 "a8ede5a2847277b13bad72d7f1c703f12c7d78dff4d47873a661033ea11cbce4"
  end

  on_intel do
    def install
      odie "notekit-cli does not publish x86_64 binaries yet; build from source instead."
    end
  end

  def install
    bin.install "notekit"
    # agent skill: installed for future install-skill / manual copy to ~/.agents/skills
    (share/"notekit/skills").install ".agents/skills/notekit"
  end

  test do
    system "#{bin}/notekit", "--help"
  end
end
