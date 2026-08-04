class Notekit < Formula
  desc "Apple Notes data pipeline CLI for AI agents"
  homepage "https://github.com/hiauhong/notekit-cli"
  version "0.1.1"
  license "MIT"

  on_arm do
    url "https://github.com/hiauhong/notekit-cli/releases/download/v0.1.1/notekit-darwin-arm64.tar.gz"
    sha256 "f500be224694a9abbbfd6b4165ff591e4282eb0e446650412cb19b526a0b88b5"
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
