
# TODO:
# Add ability to bump nvim version and rebuild

sudo apt-get install -y ninja-build gettext libtool libtool-bin autoconf \
    automake cmake g++ pkg-config unzip curl doxygen fish

if ! [ -x "$(command -v nvim)" ]; then
    if [ -f "$HOME/development/neovim/Makefile" ]; then
        echo "nvim built already"
        cd ~/development/neovim || return
    else
        echo "Build nvim"
        mkdir ~/development
        cd ~/development || return

        git clone https://github.com/neovim/neovim
        cd neovim || return
        git checkout stable
        cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
    fi
    sudo make install
    nvim -c 'PlugInstall' -c 'qa!'
fi

echo "Coping nvim config"
cp -r nvim/ ~/.config/nvim

echo "Copy config.fish to .config/fish/"
cp config.fish ~/.config/fish/

chsh -s "$(which fish)"

