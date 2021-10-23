#/bin/sh 

. ./units.sh

printf "Select configs to Setup: \n1 General\n2 Neovim\n3 Plasma\n"
read answer

display_presets


configs_list=(config/*)

num_of_tries=3

for i in {1..$num_of_tries}; do
    echo "Please select config"
    read config_index

    if [ $config_index -ge 0 ] && [ $config_index -eq $config_index ] && [ $config_index -lt ${#configs_list[@]} ];then
        break
    elif [ $i -ge $num_of_tries ];then
       echo "3 invalid inputs.. aborting... " && exit
    else
        echo "Error: please enter valid number"
    fi
done

selected_config=$(select_preset $config_index)

echo $answer | grep -q "1" && echo "contains 1" && \
    setup_general

echo $answer | grep -q "2" && echo "contains 2" && \
    setup_neovim

echo $answer | grep -q "3" && echo "contains 3" && \
    setup_plasma
