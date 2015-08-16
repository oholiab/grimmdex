#!/bin/bash -x

function setup {
  pushd ../
  ln -r -s cms/Makefile
  popd
}

function main {
  if [ ! "$(basename $(pwd))" = "cms" ]; then
    echo "grimmdex directory must be named cms... sorry." >&2
    exit 1
  fi
  if git annex status 2>/dev/null \
    && [ "$(git rev-parse --show-toplevel)" = "$(dirname $(pwd))" ] 
  then 
    setup
  else 
    echo "Parent is not top-level of a git annex repository"
  fi
}

main
