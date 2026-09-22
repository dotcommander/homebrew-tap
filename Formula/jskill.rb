class Jskill < Formula
  desc "Retrieve, inspect, and invoke local skills and knowledge"
  homepage "https://github.com/dotcommander/jskill"
  # A direct archive URL avoids redirects while sending the private-repo credential.
  url "https://codeload.github.com/dotcommander/jskill/legacy.tar.gz/7f1e0f5327c7565472f3299c46db40513d0934bb",
      headers: ["Authorization: Bearer #{ENV.fetch("HOMEBREW_JSKILL_GITHUB_TOKEN", "")}"]
  version "0.5.1"
  sha256 "809f5755721918ad23438fea165c00166fc1c1979894f7ab6d69fb9e3f82870a"
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
