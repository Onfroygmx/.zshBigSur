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


#typeset -g ZPLG_MOD_DEBUG=1
module_path+=( "$XDG_CONFIG_HOME/zinit/zmodules/Src" )
zmodload zdharma/zplugin

## Set prompt
#################
setopt prompt_subst                     # enable substitution for prompt

# Verry simple prompt
PROMPT='%F{green}%n%f %F{cyan}%(4~|%-1~/.../%2~|%~)%f %F{magenta}%B>%b%f '
RPROMPT='%(?.%F{green}.%F{red}[%?] - )%B%D{%H:%M:%S}%b%f'


zinit ice lucid id-as"module/gnu-utils"
zinit light $XDG_CONFIG_HOME/modules/gnu-utils

zinit ice lucid for \
        id-as"module/aliases"       $MODULE_DIR/aliases \
        id-as"module/colored-man"   $MODULE_DIR/colored-man \
        id-as"module/history"       $MODULE_DIR/history \
        id-as"module/dircolor"      $MODULE_DIR/dircolor \
        id-as"module/completion"    $MODULE_DIR/completion


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
