class Remindkit < Formula
  desc "Apple Reminders data pipeline CLI for AI agents"
  homepage "https://github.com/hiauhong/remindkit-cli"
  version "0.1.4"
  license "MIT"

  on_arm do
    url "https://github.com/hiauhong/remindkit-cli/releases/download/v0.1.4/remindkit-darwin-arm64.tar.gz"
    sha256 "c632c3ae379750e4e3d5cb0b5eda6c1fe569c3b906e2c1379feccc4101f42ead"
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
