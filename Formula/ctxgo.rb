class Ctxgo < Formula
  desc "Local-first searchable history index for coding-agent sessions"
  homepage "https://github.com/dotcommander/ctxgo"
  # Defer the credential until download so formula metadata never contains it.
  token_var = ENV.key?("HOMEBREW_CTXGO_GITHUB_TOKEN") ? "HOMEBREW_CTXGO_GITHUB_TOKEN" : "HOMEBREW_GITHUB_API_TOKEN"
  url "https://codeload.github.com/dotcommander/ctxgo/legacy.tar.gz/0ef54537d40336130bf412dee97b46a0ded0fa76",
      headers: ["Authorization: Bearer {{HOMEBREW_DEFERRED_ENV:#{token_var}}}"]
  version "1.2.3"
  sha256 "ea4f6da83f9960656d24240a5d3c15ac7f9a068e6ef9469bac0ea2b135276d0c"
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
