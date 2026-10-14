#!/usr/bin/env bash

# clone the github repo
echo "Installing pyenv..."
git clone https://github.com/yyuu/pyenv.git ~/.pyenv

# set variables
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

# update .bashrc
cat << 'END' >> ~/.bashrc

# pyenv settings:
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

END

# install python and virtualenv
echo "Installing python..."
pyenv install 3.12.0
pyenv install 3.14.0
pyenv global 3.12.0 3.14.0
pip install --no-cache-dir --upgrade pip
pip install --no-cache-dir virtualenv
