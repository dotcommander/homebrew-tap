class Prompter < Formula
  desc "Zero-dependency CLI for prompt enhancement, restructuring, and prompt vault search"
  homepage "https://github.com/dotcommander/prompter"
  url "https://github.com/dotcommander/prompter/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "9160aff0ab5b0dea366f5d0cd4774ffd88626adedd0ddb0950532d60f06d3d97"
  license "MIT"
  head "https://github.com/dotcommander/prompter.git", branch: "main"

  depends_on "go" => :build

  def install
    ENV["GOWORK"] = "off"
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "prompter", shell_output("#{bin}/prompter version")
    assert_match "Supported LLM Providers", shell_output("#{bin}/prompter providers")
  end
end
