#!/bin/sh

. ./units.sh

OS_DERIVATIVE=$(get_dist_id)

printf "Select configs to Setup: \n1 General\n2 Neovim\n3 Plasma\n"
read answer

echo $answer | grep -q "1" && echo "contains 1" && setup_general $OS_DERIVATIVE
echo $answer | grep -q "2" && echo "contains 2" && setup_neovim $OS_DERIVATIVE
echo $answer | grep -q "3" && echo "contains 3" && setup_plasma $OS_DERIVATIVE

