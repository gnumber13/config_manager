#/bin/sh 

. ./units.sh
configs_list=(config/*)
list_length=${#configs_list[@]}

printf "Select configs to Setup: \n1 General\n2 Neovim\n3 Plasma\n"
read answer

check_valid_input $answer || exit

display_presets
for i in {1..3}; do
    echo "Please select config"
    read config_index

    check_valid_config_selection $config_index $list_length && break

    if [ $i -ge $num_of_tries ];then
       echo "3 invalid inputs.. aborting... " && exit
    else
        echo "Error: please enter valid number"
    fi
done

selected_config=$(select_preset $config_index)

echo $selected_config

load_selected_configs_to_current_machine $answer $selected_config
