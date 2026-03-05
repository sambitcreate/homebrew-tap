# frozen_string_literal: true

class Parsely < Formula
  desc "Smart recipe scraper CLI with interactive TUI built on Ink"
  homepage "https://github.com/sambitcreate/parsely-cli"
  url "https://registry.npmjs.org/@sambitcreate/parsely-cli/-/parsely-cli-2.3.0.tgz"
  sha256 "44925ed2c9ab1e724a0bfc557b8077e9a4e9b492f72f999a1769b0a2bb166c65"
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
