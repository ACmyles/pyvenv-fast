# pyvenv-fast

A zsh plugin to launch a Python venv with one command.

## Features

- Launch a Python venv in current directory or mkcd a new directory.
- Specify Python version.

## Installation

```shell
sh <(curl -sL https://raw.githubusercontent.com/ACmyles/pyvenv-fast/master/install.sh)>
```

## Usage

```shell
pv [-v] directory
```

## Example Usage

```shell
pv .

pv new_proj

pv -v python3.7 .

pv -v python3.7 new_proj
```
