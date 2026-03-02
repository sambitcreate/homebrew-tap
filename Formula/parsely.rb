# frozen_string_literal: true

class Parsely < Formula
  desc "Smart recipe scraper CLI with interactive TUI built on Ink"
  homepage "https://github.com/sambitcreate/parsely-cli"
  url "https://registry.npmjs.org/@sambitcreate/parsely-cli/-/parsely-cli-2.1.0.tgz"
  sha256 "76f18591e3b3af0547c5e264e830d06d329f32cbe49b002d9883305959ce6770"
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
