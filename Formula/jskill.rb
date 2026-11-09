class Jskill < Formula
  desc "Retrieve, inspect, and invoke local skills and knowledge"
  homepage "https://github.com/dotcommander/jskill"
  # Defer the credential until download so formula metadata never contains it.
  token_var = ENV.key?("HOMEBREW_JSKILL_GITHUB_TOKEN") ? "HOMEBREW_JSKILL_GITHUB_TOKEN" : "HOMEBREW_GITHUB_API_TOKEN"
  url "https://codeload.github.com/dotcommander/jskill/legacy.tar.gz/2542e75beb7d5c15c26e6ba31962639471fda742",
      headers: ["Authorization: Bearer {{HOMEBREW_DEFERRED_ENV:#{token_var}}}"]
  version "0.9.1"
  sha256 "62cc91137ae8a62fe36c0098660ada384f2036b094bf5449a9641248575bc524"
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
