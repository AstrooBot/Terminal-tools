#!/bin/bash
# This scrip is used to push and pull obsidian vaults to a repository

flag=$1

# init
if [[ "$flag" == "init" ]]; then

path=$PWD
read -p "Is it vault to connect at $path ? [y/n] " des
  if [[ $des == "n" ]]; then 
    read -p "Please enter the vault directory: " path
    cd $path
  fi
echo "Downloading vault at $path... "
git clone git@github.com-personal:AstrooBot/Collegue-Notes.git
echo "Creating config file at ~/.Obsidian/config..."

  if [[ ! -f "$HOME/.Obsidian/config" ]]; then
    cd $HOME
    mkdir .Obsidian 
    cd .Obsidian
    touch config
  else 
    echo "Requirement ~/.Obsidian/config already satisfiaced"
  fi 
echo $path > config
fi


# pull  
if [[ "$flag" == "pull" ]]; then

if [[ ! -f "$HOME/.Obsidian/config" ]]; then
  echo "ERROR: config file is missing. Try init "
  else 
  path=$(cat $HOME/.Obsidian/config )
  cd $path 
  git pull origin main
  /home/astroobot/.Obsidian/Obsidian-1.8.10.AppImage
  fi
fi 

# push 

if [[ "$flag" == "init" ]]; then 

if [[ ! -f "$HOME/.Obsidian/config" ]]; then
  echo "ERROR: config file is missing. Try init "
  else 
  path=$(cat $HOME/.Obsidian/config )
  cd $path
  timestamp=$(date +%D-%T)  
  git add .
  git commit -m "Uploaded notes $timestamp"
  git push origin main
  echo "Notes was successfully updated"
  fi
fi








