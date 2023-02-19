# pyvenv-fast

A zsh plugin to launch a Python venv.  Designed with [dotpyvenv](https://github.com/jeanpantoja/dotpyvenv) in mind.

## Features

- Launch a Python venv in current directory or mkcd a new directory.
- Create .pyvenvdir to point to venv directory.
- Specify Python version.
- Add venv to .gitignore.

## Installation

### Oh My Zsh

```shell
git clone https://github.com/ACmyles/pyvenv-fast.git $ZSH_CUSTOM/plugins/pyvenv-fast
```

Add pyvenv-fast to plugins in `.zshrc`.

## Usage

```shell
pv [-g] [-v ...] directory
```

### Options

| Option | Argument | Purpose |
| ----- | ----- | -------- |
| `-g`  | _None_ | Append new venv to .gitignore.
| `-v`  | python 3.x | Specify Python version.

### Example Usage

```shell
pv new_project

pv -g .

pv -v python3.7 .

pv -g -v python3.7 new_project
```
