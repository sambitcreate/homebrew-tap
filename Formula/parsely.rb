# frozen_string_literal: true

class Parsely < Formula
  desc "Smart recipe scraper CLI with interactive TUI built on Ink"
  homepage "https://github.com/sambitcreate/parsely-cli"
  url "https://registry.npmjs.org/@sambitcreate/parsely-cli/-/parsely-cli-2.0.0.tgz"
  sha256 "e51ba9198907ff18871161ac1b6f711fc285be0a84f1af7d3fff06523264ac35"
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
