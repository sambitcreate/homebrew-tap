# frozen_string_literal: true

class Parsely < Formula
  desc "Smart recipe scraper CLI with interactive TUI built on Ink"
  homepage "https://github.com/sambitcreate/parsely-cli"
  url "https://github.com/sambitcreate/parsely-cli.git",
      tag:      "v2.0.0",
      revision: "main"
  head "https://github.com/sambitcreate/parsely-cli.git", branch: "main"

  depends_on "node"

  def install
    system "npm", "install", "-g", "@sambitcreate/parsely-cli@2.0.0", *std_npm_install_args
  end

  test do
    system bin/"parsely", "--version"
  end
end
