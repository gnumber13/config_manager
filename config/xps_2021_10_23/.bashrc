# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"
PATH=/home/matt/bin:/home/matt/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
for rc_file in ~/.bashrc.d/*.rc ; do source $rc_file ; done
