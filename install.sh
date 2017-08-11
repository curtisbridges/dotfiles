#!/usr/bin/env bash

for f in ~/Developer/dotfiles/*
do
  ln -s "$f" "$HOME/.${f##*/}"
done
