#!/bin/sh 

. ./units.sh

printf "Select configs to Setup: \n1 General\n2 Neovim\n3 Plasma\n"
read answer

echo $answer | grep -q "1" && echo "contains 1" && load_bashrc_configs_to_current_machine
echo $answer | grep -q "2" && echo "contains 2" && load_nvim_configs_to_current_machine
echo $answer | grep -q "3" && echo "contains 3" && load_konsave_configs_to_current_machine
