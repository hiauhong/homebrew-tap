class Remindkit < Formula
  desc "Apple Reminders data pipeline CLI for AI agents"
  homepage "https://github.com/hiauhong/remindkit-cli"
  version "0.1.9"
  license "MIT"

  on_arm do
    url "https://github.com/hiauhong/remindkit-cli/releases/download/v0.1.9/remindkit-darwin-arm64.tar.gz"
    sha256 "ccf1b1b055c360ac27898a783fda97e8d1a60325e2eea975b8a3ebc6dd5866e4"
  end

  on_intel do
    def install
      odie "remindkit-cli does not publish x86_64 binaries yet; build from source instead."
    end
  end

  def install
    bin.install "remindkit"
    bin.install "fetch-remindkit"
    # agent skill: install-skill resolves this via ../share/remindkit/skills/remindkit
    (share/"remindkit/skills").install ".agents/skills/remindkit"
  end

  def caveats
    <<~EOS
      Install the remindkit agent skill so AI agents can discover this tool:

        remindkit install-skill --agents

      Run it once after install; re-run after `brew upgrade` if the skill
      content changed in the new version.
    EOS
  end

  test do
    system "#{bin}/remindkit", "--help"
  end
end
