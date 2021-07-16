#!/usr/bin/env zsh
#!/bin/zsh
#              _
#      _______| |__  _ __ ___
#     |_  / __| '_ \| '__/ __|
#    _ / /\__ \ | | | | | (__
#   (_)___|___/_| |_|_|  \___|
#

if [[ ! -o login ]]; then; source $HOME/.zshenv; fi

## Autoload zsh functions
#################################################
autoload -U colors && colors
