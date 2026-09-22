class Ctxgo < Formula
  desc "Local-first searchable history index for coding-agent sessions"
  homepage "https://github.com/dotcommander/ctxgo"
  url "https://github.com/dotcommander/ctxgo.git",
      tag:      "v1.2.0",
      revision: "29a7486442eff1daf0348e3558fc728802d46300",
      using:    :git
  version "1.2.0"
  head "https://github.com/dotcommander/ctxgo.git", branch: "main"

  depends_on "go" => :build

  def install
    ENV["GOWORK"] = "off"
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/ctxgo"
  end

  test do
    assert_match "Usage: ctxgo <command> [flags]", shell_output("#{bin}/ctxgo --help")
    assert_match version.to_s, shell_output("#{bin}/ctxgo --version")
  end
end
