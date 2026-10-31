class Ctxgo < Formula
  desc "Local-first searchable history index for coding-agent sessions"
  homepage "https://github.com/dotcommander/ctxgo"
  # Defer the credential until download so formula metadata never contains it.
  token_var = ENV.key?("HOMEBREW_CTXGO_GITHUB_TOKEN") ? "HOMEBREW_CTXGO_GITHUB_TOKEN" : "HOMEBREW_GITHUB_API_TOKEN"
  url "https://codeload.github.com/dotcommander/ctxgo/legacy.tar.gz/b1862b430b59ae48b62fa1db8a140641526d79de",
      headers: ["Authorization: Bearer {{HOMEBREW_DEFERRED_ENV:#{token_var}}}"]
  version "2.0.1"
  sha256 "750485393f1261ef0ec348e02dd7e1d3dd3dc170c3b3ecd7af5b1c2a01f7d734"
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
