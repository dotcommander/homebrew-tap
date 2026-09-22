class Ctxgo < Formula
  desc "Local-first searchable history index for coding-agent sessions"
  homepage "https://github.com/dotcommander/ctxgo"
  # A direct archive URL avoids redirects while sending the private-repo credential.
  url "https://codeload.github.com/dotcommander/ctxgo/legacy.tar.gz/29a7486442eff1daf0348e3558fc728802d46300",
      headers: ["Authorization: Bearer #{ENV.fetch("HOMEBREW_CTXGO_GITHUB_TOKEN", "")}"]
  version "1.2.0"
  sha256 "5544a818acce51530b4662fec69af8e9f43655e9c73f0521dedf0d4fb2d1acb0"
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
