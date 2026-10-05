class Prompter < Formula
  desc "Refine rough input into production-grade AI prompts"
  homepage "https://github.com/dotcommander/prompter"
  url "https://github.com/dotcommander/prompter/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "0d23c025a9ae4ce7b867008b71c6b9ebb67c40d3b2d8ab935612a5cb808c2a8c"
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
