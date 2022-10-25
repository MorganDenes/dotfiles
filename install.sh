
# TODO:
# Add ability to bump nvim version and rebuild

echo "dotfile: Begin"
tempdir="$(pwd)"

sudo apt-get update
sudo apt-get install -y ninja-build gettext libtool libtool-bin autoconf \
    automake cmake g++ pkg-config unzip curl doxygen fish

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
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    fi
    echo "dotfile: Installing nvim"
    sudo make install
    nvim -c 'PlugInstall' -c 'qa!'
fi

cd $tempdir

echo "dotfile: Coping nvim config"
cp -dr nvim/ ~/.config/nvim

echo "dotfile: Copy config.fish to .config/fish/"
cp ./config.fish ~/.config/fish/

echo "dotfile: Set fish as default shell"
sudo chsh -s "$(which fish)" $USER

