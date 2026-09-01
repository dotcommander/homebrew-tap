class Prompter < Formula
  desc "CLI for prompt enhancement, restructuring, and prompt vault search"
  homepage "https://github.com/dotcommander/prompter"
  url "https://github.com/dotcommander/prompter/archive/refs/tags/v0.2.3.tar.gz"
  sha256 "177d79fc112b330193ab238a07a03da54217ec843e74f1762ebd9d76f762aa7c"
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
