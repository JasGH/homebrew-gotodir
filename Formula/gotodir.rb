class Gotodir < Formula
  desc "Arrow-key picker for jumping between project directories"
  homepage "https://github.com/JasGH/gotodir"
  url "https://github.com/JasGH/gotodir/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "REPLACE_WITH_TARBALL_SHA256"
  license "MIT"
  version "0.1.0"

  depends_on "gum"

  def install
    bin.install "bin/gotodir"
    (pkgshare).install "share/gotodir/gotodir.sh"
  end

  def caveats
    <<~EOS
      To enable the `goto` command, add this to your shell config:

        # ~/.zshrc  (or ~/.bashrc)
        [ -f "#{opt_pkgshare}/gotodir.sh" ] && source "#{opt_pkgshare}/gotodir.sh"

      Then reload your shell:

        source ~/.zshrc   # or open a new terminal

      Optional: install `claude` (https://claude.com/claude-code) to use
      the `-c` flag, which launches Claude Code in the destination dir.
    EOS
  end

  test do
    # `gotodir list` on an empty store should succeed and mention no bookmarks.
    ENV["GOTODIR_STORE"] = testpath/"projects"
    output = shell_output("#{bin}/gotodir list 2>&1")
    assert_match(/no bookmarks/i, output)

    # `gotodir add` then `gotodir get` should round-trip.
    target = testpath/"sample"
    target.mkpath
    system bin/"gotodir", "add", "sample", target.to_s
    assert_equal target.to_s, shell_output("#{bin}/gotodir get sample").strip
  end
end
