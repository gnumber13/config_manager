#!/bin/sh


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

        $(grep $OS_DERIVATIVE apt-list)) 		# 'or'|'or'|'or')
            node -v > /dev/null || sudo apt install nodejs -y
            yarn --version > /dev/null || sudo apt install yarn -y
            epiphany-browser --version > /dev/null || sudo apt install epiphany-browser -y
            ;;
        $(grep $OS_DERIVATIVE pacman-list))
            node -v > /dev/null || sudo pacman -S nodejs -y
            yarn --version > /dev/null || sudo pacman -S yarn -y
            epiphany --version > /dev/null || sudo pacman -S epiphany -y
            ;;
        $(grep $OS_DERIVATIVE dnf-list))
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
            konsave -v > /dev/null || pip install konsave
            ;;
        *) 					# ever other case
            ;;
    esac

    konsave --apply 1
}


function get_nvim_configs_from_current_machine() {
    cp -ur ~/.config/nvim configs/.config/ 
    rm -rf configs/.config/nvim/plugged
}

function get_konsave_configs_from_current_machine() {
    cp -ur ~/.config/konsave configs/.config/
    rm -rf configs/.config/konsave/.*
}

function get_bashrc_configs_from_current_machine() {
    cp -ur ~/.bashrc.d configs/.
    rm -rf configs/.bashrc.d/.*
    cp ~/.bashrc configs/.
}

function load_konsave_configs_to_current_machine() {
    mkdir -p ~/.config/konsave && echo "creating ~/.config/konsave"
    cp -ur configs/.config/konsave/* ~/.config/konsave/
}

function load_nvim_configs_to_current_machine() {
    mkdir -p ~/.config/nvim  && echo "creating ~/.confing/nvim"
    cp -ur configs/.config/nvim/* ~/.config/nvim/
}

function load_bashrc_configs_to_current_machine() {
    cp -ur configs/.bashrc.d ~/
    cp configs/.bashrc ~/
}



