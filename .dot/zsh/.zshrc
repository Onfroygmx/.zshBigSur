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

# zinit
declare -A ZINIT
ZINIT[HOME_DIR]=$XDG_CONFIG_HOME/zinit
ZINIT[BIN_DIR]=$XDG_CONFIG_HOME/zinit
ZINIT[PLUGINS_DIR]="${XDG_CONFIG_HOME:-$HOME/.config}"/plugins
ZINIT[COMPLETIONS_DIR]="${XDG_CONFIG_HOME:-$HOME/.config}"/completions
ZINIT[SNIPPETS_DIR]="${XDG_CONFIG_HOME:-$HOME/.config}"/snippets
ZINIT[ZCOMPDUMP_PATH]=$XDG_CACHE_HOME/zsh/zcompdump

source $XDG_CONFIG_HOME/zinit/zinit.zsh
module_path+=( "$XDG_CONFIG_HOME/zinit/zmodules/Src" )
zmodload zdharma/zplugin

#zinit ice lucid multisrc"aliases_*.zsh" id-as"module/aliases"
zinit ice lucid  id-as"module/aliases"
zinit light $XDG_CONFIG_HOME/modules/aliases

zinit ice lucid id-as"module/colored-man"
zinit light $XDG_CONFIG_HOME/modules/colored-man

zinit ice lucid id-as"module/history"
zinit light $XDG_CONFIG_HOME/modules/history

zinit ice lucid id-as"module/dircolor"
zinit light $XDG_CONFIG_HOME/modules/dircolor

zinit ice id-as"module/completion"
zinit light $XDG_CONFIG_HOME/modules/completion


zinit ice wait blockf
zinit light zsh-users/zsh-completions
zinit ice wait compile'{src/*.zsh,src/strategies/*}' atinit"ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=69'" atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions
zinit ice wait'!'
zinit light zsh-users/zsh-history-substring-search
zinit ice wait atload"_zsh_highlight"
zinit light zdharma/fast-syntax-highlighting

run-compinit

# Bind ^[[A/^[[B for hustory search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
