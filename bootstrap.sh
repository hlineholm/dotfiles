#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin hlineholm/master;

function doIt() {
	rsync --exclude ".git/" \
  	--exclude ".vim" \
		--exclude "bin/**" \
		--exclude "init/**" \
		--exclude ".curlrc" \
		--exclude ".DS_Store" \
		--exclude ".curlrc" \
		--exclude ".editorconfig" \
		--exclude ".gdbinit" \
		--exclude ".gvimrc" \
		--exclude ".hgignore" \
		--exclude ".gvimrc" \
		--exclude ".macos" \
		--exclude ".osx" \
		--exclude ".tmux.conf" \
		--exclude ".vimrc" \
		--exclude ".wgetrc" \
		--exclude "bootstrap.sh" \
        --exclude "bootstrap-flir.sh" \
		--exclude "brew.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
