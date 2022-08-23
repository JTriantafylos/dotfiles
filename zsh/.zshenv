export PATH="${PATH}:${HOME}/.local/bin"

# XDG Base Directory Fixes
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

export QT_QPA_PLATFORMTHEME=qt6ct
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

# Android-Studio blank window fix
export _JAVA_AWT_WM_NONREPARENTING=1
