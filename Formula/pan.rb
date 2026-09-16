class Pan < Formula
  desc "Repository evidence and guarded improvement workflows for coding agents"
  homepage "https://github.com/dotcommander/pan"
  url "https://github.com/dotcommander/pan/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "fd08c2e7e225c83e3859dddd3b9df5d5d6864486f4514f383d1fc385d1c0027f"
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
