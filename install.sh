#!/bin/sh

echo "Installing pyvenv-fast..."

# download latest from github, output to zsh custom
mkdir -p $ZSH_CUSTOM/plugins/pyvenv-fast
curl -sL https://raw.githubusercontent.com/ACmyles/pyvenv-fast/master/pyvenv-fast.plugin.zsh -o $ZSH_CUSTOM/plugins/pyvenv-fast/pyvenv-fast.plugin.zsh

echo "Installed to ${ZSH_CUSTOM}/plugins/pyvenv-fast/..."