#!/bin/sh

. ./config.sh

function get_dist_id() {
    dist_id=$(cat /etc/*-release | uniq -u | grep ^ID= | cut -d"=" -f2)
    echo $dist_id
}

function setup_general() {
    OS_DERIVATIVE=$1
    case $OS_DERIVATIVE in
        'ubuntu'|'pop'|'debian'|'Deepin') 		# 'or'|'or'|'or')
            firefox -v > /dev/null || sudo apt install firefox -y
            ;;
        'arch'|'manjaro'|'endeavouros')
            firefox -v > /dev/null || sudo pacman -S firefox -y
            ;;
        'centos'|'rocky'|'fedora')
            firefox -v > /dev/null || sudo dnf install firefox -y
            ;;
        *) 					# ever other case
            ;;
    esac

    echo "setup_general executed"
}

function setup_neovim() {
    OS_DERIVATIVE=$1
    case $OS_DERIVATIVE in

        'ubuntu'|'pop'|'debian'|'Deepin') 		# 'or'|'or'|'or')
            printf "installing nvim and dependencies..."
            nvim --version || sudo apt install neovim -y
            node -v > /dev/null || sudo apt install nodejs -y
            yarn --version > /dev/null || sudo apt install yarn -y
            epiphany-browser --version > /dev/null || sudo apt install epiphany-browser -y
            ;;
        'arch'|'manjaro'|'endeavouros')
            printf "installing nvim and dependencies..."
            nvim --version || sudo pacman -S neovim -y
            node -v > /dev/null || sudo pacman -S nodejs -y
            yarn --version > /dev/null || sudo pacman -S yarn -y
            epiphany --version > /dev/null || sudo pacman -S epiphany -y
            ;;
        'centos'|'rocky'|'fedora')
            printf "installing nvim and dependencies..."
            nvim --version || sudo dnf install neovim -y
            node -v > /dev/null || sudo dnf install nodejs -y
            yarn --version > /dev/null || sudo dnf install nodejs-yarn -y
            epiphany --version > /dev/null || sudo dnf install epiphany -y
            ;;
        *) 					# ever other case
            ;;
    esac

    # install vim-plug for neovim
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}


function setup_plasma() {
    OS_DERIVATIVE=$1
    case $OS_DERIVATIVE in

        'ubuntu'|'pop'|'debian'|'Deepin') 		# 'or'|'or'|'or')
            python3 -V > /dev/null || sudo apt install python3 -y
            konsave -v > /dev/null || pip3 install konsave
            ;;
        'arch'|'manjaro'|'endeavouros')
            python -V > /dev/null || sudo pacman -S python -y
            konsave -v > /dev/null || pip install konsave
            ;;
        'centos'|'rocky'|'fedora')
            python -V > /dev/null || sudo dnf install python -y
            python -m konsave -v > /dev/null || pip install konsave
            ;;
        *) 					# ever other case
            ;;
    esac
}

function check_valid_input() {
    answer="$1"
    [[ $answer == *1* ]] || \
    [[ $answer == *2* ]] || \
    [[ $answer == *3* ]]
}

function is_number() {
    input=$1
    [ $input -eq $input ]
}

## getting configs

function get_selected_configs() {
    answer=$1
    echo $answer | grep -q "1" && echo "contains 1" && get_bashrc_configs_from_current_machine
    echo $answer | grep -q "2" && echo "contains 2" && get_nvim_configs_from_current_machine
    echo $answer | grep -q "3" && echo "contains 3" && get_konsave_configs_from_current_machine
}
function get_nvim_configs_from_current_machine() {
    mkdir -p $config_prefix/.config/
    cp -ur ~/.config/nvim $config_prefix/.config/ 
    rm -rf $config_prefix/.config/nvim/plugged
}

function get_konsave_configs_from_current_machine() {
    mkdir -p $config_prefix/.config/
    cp -ur ~/.config/konsave $config_prefix/.config/
    delete_dotfiles '$config_prefix/.config/konsave/.*'
}

function get_bashrc_configs_from_current_machine() {
    mkdir -p $config_prefix/
    cp -ur ~/.bashrc.d $config_prefix/.
    cp ~/.bashrc $config_prefix/.
    delete_dotfiles '$config_prefix/.bashrc.d/.*'
}

function check_valid_config_selection() {
    config_index=$1
    list_length=$2
    [ $config_index -ge 0 ] && \
    [ $(is_number $config_index) ] && \ 
    [ $config_index -lt $list_length ] && \
    echo true
}

## loading configs
function load_selected_configs_to_current_machine() {
    answer=$1
    selected_config=$2

    echo $answer | grep -q "1" && echo "contains 1" && \
        load_bashrc_configs_to_current_machine $selected_config

    echo $answer | grep -q "2" && echo "contains 2" && \
        load_nvim_configs_to_current_machine $selected_config

    echo $answer | grep -q "3" && echo "contains 3" && \
        load_konsave_configs_to_current_machine $selected_config
}

function load_konsave_configs_to_current_machine() {
    selected_config_prefix=$1
    mkdir -p ~/.config/konsave && echo "creating ~/.config/konsave"
    cp -ur $selected_config_prefix/.config/konsave/* ~/.config/konsave/
}

function load_nvim_configs_to_current_machine() {
    selected_config_prefix=$1
    mkdir -p ~/.config/nvim  && echo "creating ~/.confing/nvim"
    cp -ur $selected_config_prefix/.config/nvim/* ~/.config/nvim/
}

function load_bashrc_configs_to_current_machine() {
    selected_config_prefix=$1
    cp -ur $selected_config_prefix/.bashrc.d ~/
    cp $selected_config_prefix/.bashrc ~/
}


## presets
function display_presets () {
    configs_list=(config/*)
    i=0
    for config in ${configs_list[@]};do
        config_name=$(echo $config | cut -d'/' -f2)
        printf "[%d] - %s\n" $i $config_name
        i=$(($i + 1))
    done
}

function select_preset() {
    configs_list=(config/*)
    echo ${configs_list[$1]}
}

function delete_dotfiles() {
    find -path $1 -delete && echo "deleted $1"
}
