# frozen_string_literal: true

class Parsely < Formula
  desc "Smart recipe scraper CLI with interactive TUI built on Ink"
  homepage "https://github.com/sambitcreate/parsely-cli"

  depends_on "node"

  def install
    system "npm", "install", "-g", "@sambitcreate/parsely-cli", *std_npm_install_args
  end

  test do
    system bin/"parsely", "--version"
  end
end
