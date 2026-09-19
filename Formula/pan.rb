class Pan < Formula
  desc "Repository evidence and guarded improvement workflows for coding agents"
  homepage "https://github.com/dotcommander/pan"
  url "https://github.com/dotcommander/pan/archive/refs/tags/v0.4.1.tar.gz"
  sha256 "9da76ffb2f4eb5aecc7b0ce9e91dbe538af21386621254134b961d5ff9b4d22d"
  license "MIT"
  head "https://github.com/dotcommander/pan.git", branch: "main"

  depends_on "go" => :build

  def install
    ENV["GOWORK"] = "off"
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/pan"
  end

  test do
    assert_match "pan v", shell_output("#{bin}/pan --version")
    assert_match "schema pan/v1", shell_output("#{bin}/pan version")
    assert_match "scan overview", shell_output("#{bin}/pan --repo #{testpath} scan overview")
  end
end
