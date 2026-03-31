#!/usr/bin/env bash

set -euo pipefail

bundle exec jekyll clean
bundle exec jekyll serve --host 127.0.0.1 --port 2046
