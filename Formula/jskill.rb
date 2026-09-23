class Jskill < Formula
  desc "Retrieve, inspect, and invoke local skills and knowledge"
  homepage "https://github.com/dotcommander/jskill"
  # Defer the credential until download so formula metadata never contains it.
  token_var = ENV.key?("HOMEBREW_JSKILL_GITHUB_TOKEN") ? "HOMEBREW_JSKILL_GITHUB_TOKEN" : "HOMEBREW_GITHUB_API_TOKEN"
  url "https://codeload.github.com/dotcommander/jskill/legacy.tar.gz/54a07840940999b692b80582696b8941f04470ec",
      headers: ["Authorization: Bearer {{HOMEBREW_DEFERRED_ENV:#{token_var}}}"]
  version "0.7.0"
  sha256 "00bfe1a08296e17ed99fbf70303183450080cc9faf9e7c79c758dbe9f911f652"
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
