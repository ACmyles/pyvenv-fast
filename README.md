# pyvenv-fast

A zsh plugin to launch a Python venv with one command.

Designed for use with [dotpyvenv](https://github.com/jeanpantoja/dotpyvenv) (auto venv activation on navigation).

## Features

- Launch a Python venv in current directory or mkcd a new directory.
- Set venv name the same as directory with a dot before - eg `.new_proj`
- Create .pyvenvdir to point to venv directory.
- Specify Python version.

## Installation

```shell
sh <(curl -sL https://raw.githubusercontent.com/ACmyles/pyvenv-fast/master/install.sh)
```
    Add pyvenv-fast to plugins in `.zshrc`

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
