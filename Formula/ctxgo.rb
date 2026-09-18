class Ctxgo < Formula
  desc "Local-first searchable history index for coding-agent sessions"
  homepage "https://github.com/dotcommander/ctxgo"
  url "https://github.com/dotcommander/ctxgo.git",
      tag:      "v1.1.0-go",
      revision: "5ac899a70683d95fb66d4b1a5b6fd13dd8fe6b45",
      using:    :git
  version "1.1.0"
  head "https://github.com/dotcommander/ctxgo.git", branch: "main"

  depends_on "go" => :build

  def install
    ENV["GOWORK"] = "off"
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/ctxgo"
  end

  test do
    assert_match "Search local agent history", shell_output("#{bin}/ctxgo --help")
  end
end
