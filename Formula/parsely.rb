# frozen_string_literal: true

class Parsely < Formula
  desc "Smart recipe scraper CLI with interactive TUI built on Ink"
  homepage "https://github.com/sambitcreate/parsely-cli"
  url "https://registry.npmjs.org/@sambitcreate/parsely-cli/-/parsely-cli-2.2.0.tgz"
  sha256 "99ec18bbef64ccbe5c7c8e0b3cf4f839af8389169d198ca94902cfc29d418d9a"
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
