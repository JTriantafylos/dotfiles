export PATH="${PATH}:${HOME}/.local/bin"

# XDG Base Directory definitions
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

# XDG Base Directory fixes
export QT_QPA_PLATFORMTHEME=qt6ct
export QT_STYLE_OVERRIDE=adwaita-dark
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export CUDA_CACHE_PATH="${XDG_CACHE_HOME}/nv"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=${XDG_CONFIG_HOME}/java -Dawt.useSystemAAFontSettings=lcd"
export LESSKEY="${XDG_CONFIG_HOME}/less/lesskey"
export LESSHISTFILE="${XDG_STATE_HOME}/less/history"
export XINITRC="${XDG_CONFIG_HOME}/X11/xinitrc"
export GRADLE_USER_HOME="${XDG_DATA_HOME}/gradle"
export GTK2_RC_FILES="${XDG_CONFIG_HOME}/gtk-2.0/gtkrc"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export MYSQL_HISTFILE="${XDG_STATE_HOME}/mysql_history"
export PSQL_HISTORY="${XDG_STATE_HOME}/psql_history"
export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
export GDBHISTFILE="${XDG_DATA_HOME}/gdb/history"

# Default programs
export EDITOR=nvim
export TERMINAL=kitty
export BROWSER=mullvad-browser

# Use nvim as the man pager
export MANPAGER='nvim +Man!'
export MANWIDTH=80

# fzf Catppuccin Mocha theme
export FZF_DEFAULT_OPTS=" \
    --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
    --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
    --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# Android-Studio blank window fix
export _JAVA_AWT_WM_NONREPARENTING=1

# Force Firefox to use Wayland
export MOZ_ENABLE_WAYLAND=1

# Force the GTK to use our desired theme
# Required for GTK 4 apps to use a custom theme
export GTK_THEME=catppuccin-mocha-lavender-standard+default
