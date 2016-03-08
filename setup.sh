#!/bin/bash

find $PWD -mindepth 1 -maxdepth 1 ! -name ".git" -name ".*" -exec ln -svf '{}' ~/ \;
symlinks -c ~/
