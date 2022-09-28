export HISTFILE="${XDG_STATE_HOME}/zsh/history"
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
compinit -d "${XDG_CACHE_HOME}/zsh/zcompdump-${ZSH_VERSION}"

# Module to ctrl+w to last slash or last space
autoload -U select-word-style
select-word-style bash

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
alias startx="startx \${XINITRC}"
alias grep="rg -i"
alias ssh="kitty +kitten ssh"

# Keybinds
bindkey "^[[1;5C" 	forward-word # Ctrl+Right
bindkey "^[[1;5D" 	backward-word # Ctrl+Left
bindkey "^[[H" 	    beginning-of-line # Home
bindkey "^[[F" 	    end-of-line # End
bindkey "^[[3~" 	delete-char # Delete
bindkey "^[[Z"      reverse-menu-complete # Shift+Tab

# Starship prompt
eval "$(starship init zsh)"

# zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    tmux attach -t default || tmux new -s default >/dev/null 2>&1
fi
