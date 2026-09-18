class Jskill < Formula
  desc "Resolve, render, and run Jcode-compatible skills from the command line"
  homepage "https://github.com/dotcommander/jskill"
  url "https://github.com/dotcommander/jskill.git",
      tag:      "v0.1.0",
      revision: "b25424dffc0acf74a9fdc6437e1202811a8dd251",
      using:    :git
  version "0.1.0"
  head "https://github.com/dotcommander/jskill.git", branch: "main"
  license "MIT"

  depends_on "go" => :build

  def install
    ENV["GOWORK"] = "off"
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/jskill"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/jskill --help")
    assert_match "jskill list", shell_output("#{bin}/jskill list --help")
  end
end
