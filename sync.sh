#!/bin/bash

cp ~/.zshrc ./zsh/
cp ~/.bashrc ./bash/
cp ~/.vimrc ./vim/
cp ~/.screenrc ./screen/
brew list > brew/formulas.lst

git --no-pager diff
