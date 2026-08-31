class Prompter < Formula
  desc "Zero-dependency CLI for prompt enhancement, restructuring, and prompt vault search"
  homepage "https://github.com/dotcommander/prompter"
  url "https://github.com/dotcommander/prompter/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "e268418b88fd9604480950f4d69f6908ae0b0d502363d744800853a65f7bd43f"
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
