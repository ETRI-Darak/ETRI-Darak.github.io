#!/usr/bin/env bash

set -euo pipefail

bundle exec jekyll clean
bundle exec jekyll doctor
