# History
export HISTFILE="${XDG_STATE_HOME}/zsh/history" # History file location
HISTSIZE=262144 # 256K history events stored in the internal history list
SAVEHIST=262144 # 256K history events saved to the history file
setopt EXTENDED_HISTORY # Save each history event's beginning timestamp and duration
setopt HIST_IGNORE_ALL_DUPS # Don't add duplicate history events to the internal history list
setopt HIST_REDUCE_BLANKS # Remove superfluous blanks from history events
setopt HIST_SAVE_NO_DUPS # Don't save duplicate history events if they somehow get past HIST_IGNORE_ALL_DUPS
setopt SHARE_HISTORY # Instantly import and add new history events to the history file

# Module to ctrl+w to last slash or last space
autoload -U select-word-style
select-word-style bash

# Aliases
alias vim="nvim"
alias cat="bat"
alias ls="eza -l --color=auto"
alias l="eza -lah --color=auto"
alias gs="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias mv="mv -iv"
alias rm="rm -iv"
alias cp="cp -iv"
alias grep="rg -i"
alias ssh="kitty +kitten ssh"
alias goto="cd \$(dirname \$(fzf))"
alias vimf="nvim \$(fzf)"

# Keybinds
bindkey "^[[1;5C"   forward-word # Ctrl+Right
bindkey "^[[1;5D"   backward-word # Ctrl+Left
bindkey "^[[H"      beginning-of-line # Home
bindkey "^[OH"      beginning-of-line # Home
bindkey "^[[1~"     beginning-of-line # Home
bindkey "^[[F"      end-of-line # End
bindkey "^[OF"      end-of-line # End
bindkey "^[[4~"     end-of-line # End
bindkey "^[[3~"     delete-char # Delete
bindkey "^[[Z"      reverse-menu-complete # Shift+Tab

source ~/Projects/clean-zsh-prompt/clean-zsh-prompt.zsh
czprompt add --name 'ssh' --color 'red' --shell --command '
    # Check if the current shell is being accessed via SSH
    if [[ -n "${SSH_CLIENT}" ]] || [[ -n "${SSH_TTY}" ]]; then
        print "${USER}@$(hostname)";
    fi
'
czprompt add --name 'directory' --color 'blue' --command '%~'
czprompt add --name 'git_branch' --prefix 'on ' --color 'magenta' --shell --command '
    # Check if we are in a git directory
    git rev-parse --git-dir > /dev/null 2>&1 || return;

    # Determine the current branch or tag, and output it
    GIT_BRANCH="$(git symbolic-ref -q --short HEAD)"
    GIT_TAG="$(git describe --tags --exact-match)"
    GIT_COMMIT="$(git rev-parse --short HEAD)"
    if [[ -n "${GIT_BRANCH}" ]]; then
        print " ${GIT_BRANCH}";
    elif [[ -n "${GIT_TAG}" ]]; then
        print "󰓹 ${GIT_TAG}";
    elif [[ -n "${GIT_COMMIT}" ]]; then
        print "󰜘 ${GIT_COMMIT}";
    fi
'
czprompt add --name 'git_status' --color 'red' --shell --command '
    # Check if we are in a git directory
    git rev-parse --git-dir > /dev/null 2>&1 || return;

    # Variable to hold the symbols for each type of status
    GIT_SYMBOLS="";

    # Variable to hold the output of `git status`
    GIT_STATUS="$(git status --porcelain=v1)"

    # Variable to hold the output of `git status --branch`
    GIT_BRANCH_STATUS="$(git status --branch --porcelain=v1)"

    # Check if the current branch is ahead of upstream
    grep -m 1 "ahead" <<< "${GIT_BRANCH_STATUS}" > /dev/null 2>&1 && GIT_SYMBOLS+="↑";

    # Check if the current branch is behind upstream
    grep -m 1 "behind" <<< "${GIT_BRANCH_STATUS}" > /dev/null 2>&1 && GIT_SYMBOLS+="↓";

    # Check if anything is stashed
    if [[ -n "$(git stash list)" ]]; then GIT_SYMBOLS+="$"; fi;

    # Check if we have any deleted files
    grep -m 1 "^.?D" <<< "${GIT_STATUS}" > /dev/null 2>&1 && GIT_SYMBOLS+="✘";

    # Check if we have any renamed files
    grep -m 1 "^.?R" <<< "${GIT_STATUS}" > /dev/null 2>&1 && GIT_SYMBOLS+="»";

    # Check if we have any unstaged modified files
    grep -m 1 "^.M" <<< "${GIT_STATUS}" > /dev/null 2>&1 && GIT_SYMBOLS+="!";

    # Check if we have any added, or modified and staged files
    grep -m 1 "^(A|M) " <<< "${GIT_STATUS}" > /dev/null 2>&1 && GIT_SYMBOLS+="+";

    # Check if we have any untracked files
    grep -m 1 "^\?\?" <<< "${GIT_STATUS}" > /dev/null 2>&1 && GIT_SYMBOLS+="?";

    # Outut the collection of git symbols
    if [[ -n "${GIT_SYMBOLS}" ]]; then print "[${GIT_SYMBOLS}]"; fi
'

# zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

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
