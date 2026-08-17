class Remindkit < Formula
  desc "Apple Reminders data pipeline CLI for AI agents"
  homepage "https://github.com/hiauhong/remindkit-cli"
  version "0.3.0"
  license "MIT"

  on_arm do
    url "https://github.com/hiauhong/remindkit-cli/releases/download/v0.3.0/remindkit-darwin-arm64.tar.gz"
    sha256 "82a3467fa3d76d025b6e8c36638e5b631142dd82edff5944e792acec318f0263"
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
      The remindkit agent skill is auto-synced on every run:
      missing → installed, outdated → updated (after `brew upgrade`
      the skill follows the new version automatically).

      For other agent dirs (e.g. Claude Code):

        remindkit install-skill --claude

      Disable auto-sync with REMINDKIT_NO_AUTO_SKILL=1.
    EOS
  end

  test do
    system "#{bin}/remindkit", "--help"
  end
end
