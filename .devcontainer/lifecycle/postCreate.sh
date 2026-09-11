#!/usr/bin/env bash

set -o errexit -o nounset -o pipefail

# F-prime does not ignore generated coverage/ subdirectories
git config --global core.excludesFile ~/.config/git/ignore

# fprime-bootstrap: project intializer for F-prime
pipx install fprime-bootstrap --force

# ruff: a formatter and linter for Python
# (compare to clang-format and clang-tidy for C++)
pipx install ruff --force

# uv: a Python package and project manager
# (not strictly necessary, but it is the current state-of-the-art for Python)
pipx install uv --force

