class Pan < Formula
  desc "Repository evidence and guarded improvement workflows for coding agents"
  homepage "https://github.com/dotcommander/pan"
  url "https://github.com/dotcommander/pan/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "29795d0478dbec149bf9e4873a6051f585ac27fd5d8f338b442b4df8db154eb5"
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
