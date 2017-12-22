#!/bin/bash

export dot_dir=$HOME/dotfiles

cd $HOME/dotfiles

# create symbolic links
for file in .??*; do
	[[ "$file" == ".git" ]] && continue
	[[ "$file" == ".DS_Store" ]] && continue
	[[ "$file" == ".gitignore" ]] && continue
	[[ "$file" == ".gitmodules" ]] && continue
	[[ "$file" == ".??*" ]] && continue

	# check existing files
	if [ ! -L "$HOME/${file}" ]; then
		echo "Already has ${file}. Backup for the existing ${file} ? [Y/y/N/n]"
		read ANSWER
		case $ANSWER in
			"Y" | "y" | "yes" | "Yes" | "YES" )
				echo "Backed up the existing ${file} as ${file}_bak"
				mv $HOME/${file} $HOME/${file}_bak
				;;
			* )
		esac
	fi
	ln -sfnv ${dot_dir}/${file} $HOME/${file}
done

source $HOME/.bashrc
