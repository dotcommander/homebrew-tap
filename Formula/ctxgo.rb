class Ctxgo < Formula
  desc "Local-first searchable history index for coding-agent sessions"
  homepage "https://github.com/dotcommander/ctxgo"
  # Defer the credential until download so formula metadata never contains it.
  token_var = ENV.key?("HOMEBREW_CTXGO_GITHUB_TOKEN") ? "HOMEBREW_CTXGO_GITHUB_TOKEN" : "HOMEBREW_GITHUB_API_TOKEN"
  url "https://codeload.github.com/dotcommander/ctxgo/legacy.tar.gz/634c9583b94bb29408acf11170afbdaab5c515e0",
      headers: ["Authorization: Bearer {{HOMEBREW_DEFERRED_ENV:#{token_var}}}"]
  version "2.0.0"
  sha256 "2d084729eab3b80f92090f5efd64c83574083d577cda557e4ea5e6385532d431"
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
