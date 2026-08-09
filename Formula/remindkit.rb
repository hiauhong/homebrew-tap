class Remindkit < Formula
  desc "Apple Reminders data pipeline CLI for AI agents"
  homepage "https://github.com/hiauhong/remindkit-cli"
  version "0.2.1"
  license "MIT"

  on_arm do
    url "https://github.com/hiauhong/remindkit-cli/releases/download/v0.2.1/remindkit-darwin-arm64.tar.gz"
    sha256 "8a628c2839610b55ea69f7279853367ec2c3a416356d838a1a6e28b10231bbe1"
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
