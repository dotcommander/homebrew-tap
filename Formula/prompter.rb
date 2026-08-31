class Prompter < Formula
  desc "Zero-dependency CLI for prompt enhancement, restructuring, and prompt vault search"
  homepage "https://github.com/dotcommander/prompter"
  url "https://github.com/dotcommander/prompter/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "95b88cd22abda95d2ec0ad15a8907e51f42ef21620eb511bc6a7ffc0681e1a1e"
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
