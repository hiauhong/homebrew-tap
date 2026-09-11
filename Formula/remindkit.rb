class Remindkit < Formula
  desc "Apple Reminders data pipeline CLI for AI agents"
  homepage "https://github.com/hiauhong/remindkit-cli"
  version "0.3.6"
  license "MIT"

  on_arm do
    url "https://github.com/hiauhong/remindkit-cli/releases/download/v0.3.6/remindkit-darwin-arm64.tar.gz"
    sha256 "c35b7912e37d29a4c7fd124a5991edfd59a5dd54cc815e298973d5a0911cd930"
  end

  on_intel do
    def install
      odie "remindkit-cli does not publish x86_64 binaries yet; build from source instead."
    end
  end

  # Prebuilt-binary bottle, deliberately tagged `all`.
  #
  # This formula only copies prebuilt binaries — it compiles nothing. Without a
  # matching bottle Homebrew treats the install as a source build and runs
  # `fatal_build_from_source_checks`, which demands an Xcode whose major version
  # matches the running macOS (e.g. macOS 27 + Xcode 26 → hard failure, even
  # though no compiler is ever used). An `all` bottle matches every tag, so brew
  # pours it and skips those checks entirely. Rebuilt and re-uploaded by
  # remindkit-cli's release workflow on every tag.
  bottle do
    root_url "https://github.com/hiauhong/remindkit-cli/releases/download/v0.3.6"
    sha256 cellar: :any_skip_relocation, all: "ed84abeba13d0dfcdcd39913a4ff077b1407271878b3d34e977456b25f926e74"
  end

  depends_on arch: :arm64

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
