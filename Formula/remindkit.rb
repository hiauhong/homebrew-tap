class Remindkit < Formula
  desc "Apple Reminders data pipeline CLI for AI agents"
  homepage "https://github.com/hiauhong/remindkit-cli"
  version "0.1.0"
  license "MIT"

  on_arm do
    url "https://github.com/hiauhong/remindkit-cli/releases/download/v0.1.0/remindkit-darwin-arm64.tar.gz"
    sha256 "2cf0856f974510aad8b8261dd553b8b40d6013b45e06d2f62e58f07a4e8be479"
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
