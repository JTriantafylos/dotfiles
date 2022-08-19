export HISTFILE="$XDG_STATE_HOME"/zsh/history
HISTSIZE=65536
SAVEHIST=65536

# Completion
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle :compinstall filename '/home/james/.zshrc'
autoload -Uz compinit
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

# Module to ctrl+w to last slash or last space
autoload -U select-word-style
select-word-style bash

# Defaults
export EDITOR=nvim
export TERMINAL=kitty
export BROWSER=firefox

# Aliases
alias vim="nvim"
alias cat="bat --theme=base16-256 --paging=never"
alias ls="exa -l --color=auto"
alias l="exa -lah --color=auto"
alias gs="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias mv="mv -iv"
alias rm="rm -iv"
alias cp="cp -iv"
alias startx="startx "$XINITRC""
alias grep="rg -i"
alias ssh="kitty +kitten ssh"

# Use neovim as the man pager
export MANPAGER='nvim +Man!'
export MANWIDTH=999

# Keybinds
bindkey "^[[1;5C" 	forward-word # Ctrl+Right
bindkey "^[[1;5D" 	backward-word # Ctrl+Left
bindkey "^[[H" 	    beginning-of-line # Home
bindkey "^[[F" 	    end-of-line # End
bindkey "^[[3~" 	delete-char # Delete

# Starship prompt
eval "$(starship init zsh)"

# zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Base16
BASE16_THEME_DEFAULT="eighties"

# Base16 Shell
BASE16_SHELL_PATH="$XDG_CONFIG_HOME/base16-shell"
[ -n "$PS1" ] && \
  [ -s "$BASE16_SHELL_PATH/profile_helper.sh" ] && \
    source "$BASE16_SHELL_PATH/profile_helper.sh"

# Base16 FZF
BASE16_FZF_PATH="$XDG_CONFIG_HOME/base16-fzf"
source "$BASE16_FZF_PATH/bash/base16-${BASE16_THEME}.config"
