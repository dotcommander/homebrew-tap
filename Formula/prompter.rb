class Prompter < Formula
  desc "Refine rough input into production-grade AI prompts"
  homepage "https://github.com/dotcommander/prompter"
  url "https://github.com/dotcommander/prompter/archive/refs/tags/v0.5.1.tar.gz"
  sha256 "eb367b59875acf09dda9cccc116021cb230bdbc38405ae52d532a3672c843b7c"
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
