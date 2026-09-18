class Jskill < Formula
  desc "Find, render, validate, and invoke skills from a canonical local catalog"
  homepage "https://github.com/dotcommander/jskill"
  url "https://github.com/dotcommander/jskill.git",
      tag:      "v0.2.0",
      revision: "266e806b282689853648b5e918b972680e0a9353",
      using:    :git
  head "https://github.com/dotcommander/jskill.git", branch: "main"
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
