class Jskill < Formula
  desc "Retrieve, inspect, and invoke local skills and knowledge"
  homepage "https://github.com/dotcommander/jskill"
  url "https://github.com/dotcommander/jskill.git",
      tag:      "v0.4.0",
      revision: "1214d92aa0801e294872fef3f47783755d8b52a5",
      using:    :git
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
