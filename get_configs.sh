#!/bin/sh

. ./units.sh
printf "Select configs to Setup: \n1 General\n2 Neovim\n3 Plasma\n"
read answer

echo $answer | grep -q "1" && echo "contains 1" && get_bashrc_configs_from_current_machine
echo $answer | grep -q "2" && echo "contains 2" && get_nvim_configs_from_current_machine
echo $answer | grep -q "3" && echo "contains 3" && get_konsave_configs_from_current_machine
