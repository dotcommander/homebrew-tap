class Prompter < Formula
  desc "CLI for prompt enhancement, restructuring, and prompt vault search"
  homepage "https://github.com/dotcommander/prompter"
  url "https://github.com/dotcommander/prompter/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "27ac099737b33621d4445ec1da71452352a7a885e1b542f379a109998a7691af"
  license "MIT"
  head "https://github.com/dotcommander/prompter.git", branch: "main"

  depends_on "go" => :build

  def install
    ENV["GOWORK"] = "off"
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    assert_match "prompter v", shell_output("#{bin}/prompter --version")
    assert_match "test", shell_output("#{bin}/prompter image 'test'")
  end
end
