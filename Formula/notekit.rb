class Notekit < Formula
  desc "Apple Notes data pipeline CLI for AI agents"
  homepage "https://github.com/hiauhong/notekit-cli"
  version "0.1.1"
  license "MIT"

  on_arm do
    url "https://github.com/hiauhong/notekit-cli/releases/download/v0.1.1/notekit-darwin-arm64.tar.gz"
    sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  end

  on_intel do
    def install
      odie "notekit-cli does not publish x86_64 binaries yet; build from source instead."
    end
  end

  def install
    bin.install "notekit"
    # JXA resource bundle (fetch-notes.js / note-write.js) — must sit next to the binary
    (bin/"notekit_notekit.bundle").install Dir["notekit_notekit.bundle/*"]
    # agent skill: installed for manual copy to ~/.agents/skills
    (share/"notekit/skills").install ".agents/skills/notekit"
  end

  test do
    system "#{bin}/notekit", "--help"
  end
end
