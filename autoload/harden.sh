if [ -n "$(git status --porcelain)" ]
  then echo "$(black_on_light_red '!! Your dotfiles have been modified !!')\n"
fi
