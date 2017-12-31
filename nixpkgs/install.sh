#!/usr/bin/env bash
set -e

echo "Installing nix profile"
nix-env -i all

pushd $HOME > /dev/null

popd > /dev/null

echo "Done"

