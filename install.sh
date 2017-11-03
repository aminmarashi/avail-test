#! /bin/bash

BIN_DIR=~/bin/availability-test
rm -rfv "$BIN_DIR"
mkdir -p "$BIN_DIR"
make DESTDIR="$BIN_DIR" install
grep "$BIN_DIR" ~/.bashrc >/dev/null 2>&1 || echo 'export PATH="$PATH:'"$BIN_DIR"'";' >> ~/.bashrc
export PATH="$PATH:$BIN_DIR"

echo """
Availability test is now installed in $BIN_DIR.
Its path is added to your ~/.bashrc file.
You can now start using avail-start
Good luck ;)
"""
