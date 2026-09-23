class Jskill < Formula
  desc "Retrieve, inspect, and invoke local skills and knowledge"
  homepage "https://github.com/dotcommander/jskill"
  # Defer the credential until download so formula metadata never contains it.
  token_var = ENV.key?("HOMEBREW_JSKILL_GITHUB_TOKEN") ? "HOMEBREW_JSKILL_GITHUB_TOKEN" : "HOMEBREW_GITHUB_API_TOKEN"
  url "https://codeload.github.com/dotcommander/jskill/legacy.tar.gz/3c098e2504ca45214a756913e945f524c0b4adbc",
      headers: ["Authorization: Bearer {{HOMEBREW_DEFERRED_ENV:#{token_var}}}"]
  version "0.6.0"
  sha256 "5055ce4dd61405a1a1a28ac1d7c43852368b786c7322c36cbe738b30507d4d50"
  head "https://github.com/dotcommander/jskill.git", branch: "main"
  depends_on "go" => :build

  def install
    ENV["GOWORK"] = "off"
    ldflags = "-s -w -X github.com/dotcommander/jskill/internal/app.version=#{version}"
    system "go", "build", *std_go_args(ldflags:), "./cmd/jskill"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/jskill --help")
    assert_match "jskill list", shell_output("#{bin}/jskill list --help")
  end
end
