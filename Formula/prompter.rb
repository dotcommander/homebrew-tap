class Prompter < Formula
  desc "Zero-dependency CLI for prompt enhancement, restructuring, and prompt vault search"
  homepage "https://github.com/dotcommander/prompter"
  url "https://github.com/dotcommander/prompter/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "3b55522a164624c174d7cb6b97ecc0da057b5b548b087459da7f10325fbb4c6d"
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
