#!/usr/bin/env bash

# ----------------------------------------------------------------------
# Setup config variables and env
# ----------------------------------------------------------------------

if [ -z "$BASE16_XRESOURCES_PATH" ]; then
  BASE16_XRESOURCES_PATH="$HOME/.config/base16-xresources"
fi

# If BASE16_XRESOURCES_PATH doesn't exist, stop hook
if [ ! -d "$BASE16_XRESOURCES_PATH" ]; then
  return 2
fi

# ----------------------------------------------------------------------
# Execution
# ----------------------------------------------------------------------

# If base16-xresources is used, provide a file for base16-xresources to source
if [ -e "$BASE16_XRESOURCES_PATH/xresources/base16-$BASE16_THEME-256.Xresources" ]; then 
  xrdb -override "$BASE16_XRESOURCES_PATH/xresources/base16-$BASE16_THEME-256.Xresources"
else
  output="'$BASE16_THEME' theme could not be found. "
  output+="Make sure '$BASE16_XRESOURCES_PATH' is running the most up-to-date "
  output+="version by doing a 'git pull' in the repository directory."
  echo $output
fi
