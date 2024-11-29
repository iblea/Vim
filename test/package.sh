#!/bin/bash

# https://github.com/VSCodeVim/Vim/blob/master/.github/CONTRIBUTING.md

PKG_NAME="vim-dev-1.28.2.vsix"

curpath=$(dirname "$(realpath $0)")
cd "$curpath"

if [ -f "$PKG_NAME" ]; then
  rm -f "$PKG_NAME"
fi


yarn build
yarn package

if [ ! -f "$PKG_NAME" ]; then
  echo "Error: Build Failed !!"
  exit 1
fi

echo "Build Success !!!"

code --install-extension "$PKG_NAME" --force