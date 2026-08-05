class Remindkit < Formula
  desc "Apple Reminders data pipeline CLI for AI agents"
  homepage "https://github.com/hiauhong/remindkit-cli"
  version "0.1.5"
  license "MIT"

  on_arm do
    url "https://github.com/hiauhong/remindkit-cli/releases/download/v0.1.5/remindkit-darwin-arm64.tar.gz"
    sha256 "d2648c2382b69e379d7763de72fc397aecfe08a98eb1214a2c3845a6c8a100f4"
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

  test do
    system "#{bin}/remindkit", "--help"
  end
end
