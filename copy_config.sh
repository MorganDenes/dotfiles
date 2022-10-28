#!/bin/bash

echo "dotfile: Coping nvim config"
cp -drf nvim/ ~/.config/

echo "dotfile: Copy config.fish to .config/fish/"
cp -f ./config.fish ~/.config/fish/

