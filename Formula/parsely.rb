# frozen_string_literal: true

class Parsely < Formula
  desc "Smart recipe scraper CLI with interactive TUI built on Ink"
  homepage "https://github.com/sambitcreate/parsely-cli"
  url "https://registry.npmjs.org/@sambitcreate/parsely-cli/-/parsely-cli-2.4.0.tgz"
  sha256 "f146a3da6df14c3c1defee10ae52f54e62ba8ef9744f5d48fd66478f51ade700"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args(prefix: libexec)
    bin.install_symlink libexec/"bin/parsely"
  end

  test do
    system bin/"parsely", "--version"
  end
end
