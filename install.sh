#!/bin/bash

# TODO:instinst
# Add ability to bump nvim version and rebuild

echo "dotfile: Begin"
tempdir="$(pwd)"

sudo apt-get update
sh ./install_dependencies.sh

if ! [ -x "$(command -v nvim)" ]; then
    if [ -f "$HOME/development/neovim/Makefile" ]; then
        echo "dotfile: nvim built already"
        cd ~/development/neovim || return
    else
        echo "dotfile: Build nvim"
        mkdir ~/development
        cd ~/development || return

        git clone https://github.com/neovim/neovim
        cd neovim || return
        git checkout stable
        cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
        echo "dotfile: Adding VimPlug"
        curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi

    echo "dotfile: Installing nvim"
    sudo make install
    nvim --headless +PlugInstall +qa
fi

cd "$tempdir" || exit

sh copy_config.sh

echo "dotfile: Set fish as default shell"
sudo chsh -s "$(which fish)" "$USER"

