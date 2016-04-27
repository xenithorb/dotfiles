#!/bin/bash

find "$PWD" -mindepth 1 -maxdepth 1 -type d ! -name ".git" -print0 | \
	while read -rd '' dir; do
		echo rm -rf ~/"${dir##*/}"
	done

find "$PWD" -mindepth 1 -maxdepth 1 ! -name ".git" -name ".*" -exec ln -svf '{}' ~/ \;

symlinks -c ~/
