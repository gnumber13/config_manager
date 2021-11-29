#!/bin/sh
. ./units.sh

printf "Select configs to Setup: \n1 General\n2 Neovim\n3 Plasma\n"
read answer

get_selected_configs $answer
