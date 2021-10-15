# pyvenv-fast
A zsh plugin to launch a Python venv with one command.

## Features
- Launch a Python venv in current directory or mkcd a new directory.
- Specify Python version.

## Installation
```
sh <(curl -sL https://raw.githubusercontent.com/ACmyles/pyvenv-fast/master/install.sh)>
```

## Usage
```
pv [-v] directory
```

## Example Usage
```
pv .

pv new_proj

pv -v python3.7 .

pv -v python3.7 new_proj
```