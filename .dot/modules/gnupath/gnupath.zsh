#!/usr/bin/env zsh
#!/bin/zsh

path=(
  /usr/local/opt/coreutils/libexec/gnubin
  /usr/local/opt/gnu-time/libexec/gnubin
  /usr/local/{sbin,bin}
  /usr/{sbin,bin}
  /{sbin,bin}
  ~/bin
  $path
)

# Set the list of directories that man searches for manuals.
manpath=(
  /usr/local/share/man
  /usr/share/man
  $manpath
)

# Ensure path arrays do not contain duplicates.
typeset -gU path manpath
