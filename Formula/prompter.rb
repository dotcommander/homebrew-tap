class Prompter < Formula
  desc "Refine rough input into production-grade AI prompts"
  homepage "https://github.com/dotcommander/prompter"
  url "https://github.com/dotcommander/prompter/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "d63c5f2210409925399a4e947851f1e5e2dcdf68bde354851ebff59b6b3a8ff4"
  license "MIT"
  head "https://github.com/dotcommander/prompter.git", branch: "main"

  depends_on "go" => :build

  def install
    ENV["GOWORK"] = "off"
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "prompter v", shell_output("#{bin}/prompter --version")
    assert_match version.to_s, shell_output("#{bin}/prompter --version")
    assert_match "test", shell_output("#{bin}/prompter --image 'test'")
  end
end
