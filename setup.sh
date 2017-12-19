#!/bin/bash

# check existing vimrc
if [ -f "$HOME/.vimrc" ]; then
	echo "Already has a vimrc file. Backup for the existing vimrc ? [Y/y/N/n]"
	read ANSWER
	case $ANSWER in
		"Y" | "y" | "yes" | "Yes" | "YES" )
			if [ -L $HOME/.vimrc ]; then
				echo "The vimrc is a symbolic link."
			else
				mv $HOME/.vimrc $HOME/.vimrc_bak
				echo "Backed up the existing vimrc as .vimrc_bak"
			fi
			;;
		* )
			echo "Check your existing vimrc file.";;
	esac
fi

# check existing bashrc
if [ -f "$HOME/.bashrc" ]; then
	echo "Already has a bashrc file. Backup for the existing bashrc ? [Y/y/N/n]"
	read ANSWER
	case $ANSWER in
		"Y" | "y" | "yes" | "Yes" | "YES" )
			if [ -L $HOME/.bashrc ]; then
				echo "The bashrc is a symbolic link."
			else
				mv $HOME/.bashrc $HOME/.bashrc_bak
				echo "Backed up the existing bashrc as .bashrc_bak"
			fi
			;;
		* )
			echo "Check your existing bashrc file.";;
	esac
fi
