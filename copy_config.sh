#!/usr/bin/fish

# echo "dotfile: Coping nvim config"
cp -drf nvim/ ~/.config/

# echo "dotfile: Copy config.fish to .config/fish/"
cp -f ./config.fish ~/.config/fish/

# set open_tag "# DOTFILES START"
# set close_tag "# DOTFILES END"
# 
# set target_file "$HOME/.config/fish/config.fish"
# 
# set file_content (cat $target_file | string split0)
# set existing (string match -er $open_tag"[\s\S]*"$close_tag $file_content | string split0)
# set content $open_tag\n\n(cat ./config.fish | string split0)$close_tag
# 
# if [ $existing ]
#     echo "Replacing section"
#     # set old (string replace -a \n '\n' $existing)
#     # set old (string replace -a \0 '' $old)
#     # command echo $old | cat -A
#     # command perl -0pe "s|$existing| |" $target_file
#     # command sed -i "s|$old| |g" $target_file
#     # echo $content
#     set x_existing (string replace -a \" \\\" $existing)
#     set x_content (string replace -a \" \\\" $content)
#     set x_file_content (string replace -a \" \\\" $file_content)
#     # echo $x_content
#     echo (string replace "$existing" "$content" "$x_file_content" | string split0)
# else
#     echo "Adding new section"
#     echo $content\n >> $target_file
# end

