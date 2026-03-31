#!/usr/bin/env bash

set -euo pipefail

if [ "$(id -u)" -eq 0 ]; then
  owner_name="${SUDO_USER:-your-user}"
  echo "Do not run setup.sh with sudo."
  echo "This script writes gems into ./vendor/bundle and sudo can break file ownership."
  echo "If permissions are already broken, fix them with:"
  echo "  sudo chown -R ${owner_name} ./vendor"
  exit 1
fi

bundler_version="$(bundle -v 2>/dev/null | awk '{print $3}')"

if [ -z "${bundler_version}" ]; then
  echo "Bundler is not installed."
  echo "Install Bundler 2.1.4 first, then rerun ./setup.sh."
  echo "Recommended:"
  echo "  gem install bundler:2.1.4 --user-install"
  echo "  export PATH=\"\$(ruby -e 'print Gem.user_dir')/bin:\$PATH\""
  echo "If you prefer a system-wide install on macOS system Ruby:"
  echo "  sudo gem install bundler:2.1.4"
  exit 1
fi

bundler_major="${bundler_version%%.*}"

if [ "${bundler_major}" -lt 2 ]; then
  echo "Bundler ${bundler_version} detected."
  echo "This project works best with Bundler 2.1.4 on Ruby 2.6."
  echo "Recommended:"
  echo "  gem install bundler:2.1.4 --user-install"
  echo "  export PATH=\"\$(ruby -e 'print Gem.user_dir')/bin:\$PATH\""
  echo "If you prefer a system-wide install on macOS system Ruby:"
  echo "  sudo gem install bundler:2.1.4"
  exit 1
fi

bundle config set path vendor/bundle
bundle config set force_ruby_platform true
bundle install
