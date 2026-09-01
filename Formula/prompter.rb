class Prompter < Formula
  desc "CLI for prompt enhancement, restructuring, and prompt vault search"
  homepage "https://github.com/dotcommander/prompter"
  url "https://github.com/dotcommander/prompter/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "2b823215d6dd7c323a616f5e1cb01d21c23deaab0fa99069d4ece2c092bf84d5"
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
