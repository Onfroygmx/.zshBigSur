#!/usr/bin/env zsh
#!/bin/zsh
#   _____          _        _ _
#  |_   _|        | |      | | |
#    | | _ __  ___| |_ __ _| | |
#    | || '_ \/ __| __/ _` | | |
#   _| || | | \__ \ || (_| | | |
#   \___/_| |_|___/\__\__,_|_|_|
#
# https://patorjk.com/software/taag/#p=display&c=bash&f=Doom&t=Install
### Install basic tools

## Autoload zsh functions
#################################################
autoload -U colors && colors

## Export work folders
#################################################
export XDG_CONFIG_HOME=$HOME/.dot

export ZDOTDIR=${XDG_CONFIG_HOME:-$HOME/.config}/zsh

# zinit
declare -A ZINIT
ZINIT[HOME_DIR]=$XDG_CONFIG_HOME/zinit
ZINIT[BIN_DIR]=$XDG_CONFIG_HOME/zinit
ZINIT[PLUGINS_DIR]="${XDG_CONFIG_HOME:-$HOME/.config}"/plugins
ZINIT[COMPLETIONS_DIR]="${XDG_CONFIG_HOME:-$HOME/.config}"/completions
ZINIT[SNIPPETS_DIR]="${XDG_CONFIG_HOME:-$HOME/.config}"/snippets
ZINIT[ZCOMPDUMP_PATH]=$XDG_CACHE_HOME/zsh/zcompdump

printf "\n$fg[green]Clone: Onfroygmx/.zshBigSur$reset_color\n"
mkdir -p $XDG_CONFIG_HOME
git clone --bare https://github.com/Onfroygmx/.zshBigSur.git $HOME/.dotgit
git --git-dir=$HOME/.dotgit --work-tree=$HOME checkout

[[ ! -d "$XDG_CONFIG_HOME/modules/gnu-utils" ]] && mkdir -p $XDG_CONFIG_HOME/modules/gnu-utils
printf "\n$fg[green]Download: ohmyzsh/gnu-utils$reset_color\n"
curl -# https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/gnu-utils/gnu-utils.plugin.zsh > $XDG_CONFIG_HOME/modules/gnu-utils/gnu-utils.zsh

## Set zshenv file
[[ ! -f $HOME/.zshenv ]] && [[ -f $ZDOTDIR/zshenv ]] && ln -s $ZDOTDIR/zshenv $HOME/.zshenv

find $XDG_CONFIG_HOME -type d -print0 | xargs -0 chmod 700
mv .dotgit $XDG_CONFIG_HOME

printf "\n$fg[green]Clone: zdharma/zinit$reset_color\n"
git clone https://github.com/zdharma/zinit.git $XDG_CONFIG_HOME/zinit

source $XDG_CONFIG_HOME/zinit/zinit.zsh

zinit module build

printf "\n$fg[yellow]Add -Wno-implicit-function-declaration to CFLAGS in zinit-autoload.zsh on macos X$reset_color\n"
