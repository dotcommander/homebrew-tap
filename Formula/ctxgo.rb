class Ctxgo < Formula
  desc "Local-first searchable history index for coding-agent sessions"
  homepage "https://github.com/dotcommander/ctxgo"
  # Defer the credential until download so formula metadata never contains it.
  token_var = ENV.key?("HOMEBREW_CTXGO_GITHUB_TOKEN") ? "HOMEBREW_CTXGO_GITHUB_TOKEN" : "HOMEBREW_GITHUB_API_TOKEN"
  url "https://codeload.github.com/dotcommander/ctxgo/legacy.tar.gz/181e3d3863bcdddd050f43f54bd5654efabb2cd1",
      headers: ["Authorization: Bearer {{HOMEBREW_DEFERRED_ENV:#{token_var}}}"]
  version "1.4.0"
  sha256 "a6f3e56221b8c28c1cd36dfa584653bb52078fdcbccc93a03c72aa30efc00e8e"
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
