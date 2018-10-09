#!/usr/bin/env bash

for f in ~/Developer/Personal/dotfiles/*
do
  ln -sf "$f" "$HOME/.${f##*/}"
done
