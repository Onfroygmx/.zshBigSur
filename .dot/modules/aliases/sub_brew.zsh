#!/usr/bin/env zsh
#!/bin/zsh

alias bubo='brew update && brew outdated'
alias bubc='brew upgrade && brew cleanup'
alias bcubo='brew update && brew outdated --cask'
alias bcubc='brew upgrade --cask && brew cleanup'

alias bubu='bubo && bubc'
alias bcubu='bcubo && bcubc'
