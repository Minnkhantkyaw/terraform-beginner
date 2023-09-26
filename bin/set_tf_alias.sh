#!/usr/bin/env bash

# Check if the alias already exists in the .bash_profile
grep -q 'alias tf="terraform"' ~/.bash_profile

# $? is a special variable in bash that holds the exit status of the last command executed
if [ $? -ne 0 ]; then
  echo "alias tf='terraform'" >> ~/.bash_profile
  echo "alias ls='ls -al'" >> ~/.bash_profile
  # Source .bash_profile to apply changes immediately
  source ~/.bash_profile
  echo "Alias 'tf' and 'ls' added to .bash_profile and sourced."
else
  echo "Error: ~/.bash_profile is not writable or does not exist."
  echo "cat  ~/.bash_profile"
fi