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

## Set prompt
#################
setopt prompt_subst                     # enable substitution for prompt

# Verry simple prompt
PROMPT='%F{green}%n%f %F{cyan}%(4~|%-1~/.../%2~|%~)%f %F{magenta}%B>%b%f '
RPROMPT='%(?.%F{green}.%F{red}[%?] - )%B%D{%H:%M:%S}%b%f'

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

zinit ice lucid id-as"module/gnu-utils"
zinit light $XDG_CONFIG_HOME/modules/gnu-utils

zinit ice lucid id-as"module/aliases"
zinit light $XDG_CONFIG_HOME/modules/aliases

zinit ice lucid id-as"module/colored-man"
zinit light $XDG_CONFIG_HOME/modules/colored-man

zinit ice lucid id-as"module/history"
zinit light $XDG_CONFIG_HOME/modules/history

zinit ice lucid id-as"module/dircolor"
zinit light $XDG_CONFIG_HOME/modules/dircolor

zinit ice lucid id-as"module/completion"
zinit light $XDG_CONFIG_HOME/modules/completion


zinit ice wait lucid blockf
zinit light zsh-users/zsh-completions
zinit ice wait lucid compile'{src/*.zsh,src/strategies/*}' atinit"ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=69'" atload"_zsh_autosuggest_start"
zinit light zsh-users/zsh-autosuggestions
zinit ice wait'!' lucid
zinit light zsh-users/zsh-history-substring-search
zinit ice wait lucid atload"_zsh_highlight"
zinit light zdharma/fast-syntax-highlighting

run-compinit

# Bind ^[[A/^[[B for hustory search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
