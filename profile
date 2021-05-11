# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

#eval $(dircolors /home/cashweaver/third_party/dircolors-solarized/dircolors.256dark)
eval $(dircolors /home/cashweaver/.config/dircolors/dircolors-solarized/dircolors.256dark)

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

source "${DIR}/.screenlayout/landscape_portrait_portrait.sh"
#source "${DIR}/.screenlayout/left_center_right.sh"

#source "${DIR}/.scripts/config/monitors.sh"
#xrandr \
  #--output DVI-D-1 --off \
  #--output DP-3 --off \
  #--output $left_monitor_output_name --off \
  #--output $center_monitor_output_name --off \
  #--output $right_monitor_output_name --off \
  #--output $left_monitor_output_name --mode 2560x1440 --pos 0x0 --rotate right \
  #--output $center_monitor_output_name --mode 2560x1440 --pos 1440x0 --rotate right \
  #--output $right_monitor_output_name --primary --mode 2560x1440 --pos 2880x0 --rotate left
