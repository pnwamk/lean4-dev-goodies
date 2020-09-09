#!/bin/bash

# set up aliases to lean4-dev-bin

LEAN4_DEV_BIN_DEFAULT=/usr/local/bin/lean4-dev-bin
PREFIX_DEFAULT=/usr/local/bin
NAMES="lean leanc leanmake"

read -e -p "Where is the lean4-dev-bin script located? (default: $LEAN4_DEV_BIN_DEFAULT)" LEAN4_DEV_BIN
LEAN4_DEV_BIN=${LEAN4_DEV_BIN:-$LEAN4_DEV_BIN_DEFAULT}
read -e -p "In which directory should I create the links? (default: $PREFIX_DEFAULT)" PREFIX
PREFIX=${PREFIX:-$PREFIX_DEFAULT}

for name in $NAMES
do
  if [ -e "$PREFIX/$name" ]
  then
    echo "$PREFIX/$name already exists, not linking";
    continue
  else
    mkdir -p $PREFIX
    ln -s $LEAN4_DEV_BIN $PREFIX/$name
    echo "Linking $PREFIX/$name";
  fi
done
