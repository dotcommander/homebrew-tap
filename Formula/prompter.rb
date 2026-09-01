class Prompter < Formula
  desc "CLI for prompt enhancement, restructuring, and prompt vault search"
  homepage "https://github.com/dotcommander/prompter"
  url "https://github.com/dotcommander/prompter/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "a324388a500ea729dc059a462527bbae5f98f6b4de139453f2c68c2ca3ae54f2"
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
