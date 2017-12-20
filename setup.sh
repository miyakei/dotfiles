#!/bin/bash

export dotfiles_dir=$HOME/dotfiles

cd $HOME/dotfiles

# create symbolic links
for file in .??*; do
	[[ "$file" == ".git" ]] && continue
	[[ "$file" == ".DS_Store" ]] && continue
	[[ "$file" == ".??*" ]] && continue

	# check existing files
	if [ -f "$HOME/${file}" ]; then
		echo "Already has ${file}. Backup for the existing ${file} ? [Y/y/N/n]"
		read ANSWER
		case $ANSWER in
			"Y" | "y" | "yes" | "Yes" | "YES" )
				if [ -L $HOME/${file} ]; then
					echo "The ${file} is a symbolic link."
				else
					mv $HOME/${file} $HOME/${file}_bak
					echo "Backed up the existing ${file} as ${file}_bak"
				fi
				;;
			* )
				echo "Check your existing ${file}.";;
		esac
	else
		ln -sf ${dotfiles_dir}/${file} $HOME/${file}
		echo "Created symbolic link for ${file}"
	fi
done

source $HOME/.bashrc
