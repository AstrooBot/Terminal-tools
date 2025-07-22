#!/bin/bash

# This script connect obsidian notes to a git repository in order to keep
# update your notes

flag=$1
config_path=$HOME/.Obsidian/config
declare -A config

save_config () {

    echo "Saving data :3 ..."
    config[repository]=$repo
    config[vault_path]=$path
    config[obsidian_path]=$obsidian_path
    config[repository_name]=$repo_name
    config[user_name]=$user_name
    config[user_email]=$user_email

    for key in "${!config[@]}"; do
        string+=$key%${config[$key]}%
    done 
    echo $string > $config_path

}

load_config () {

    echo "Loading data :3 ..."
    raw_config=$(cat $config_path)
    IFS='%' read -ra string <<< $raw_config 
    for ((i=0; $((i + 1))<${#string[@]}; i+=2))
    do

        config[${string[$i]}]=${string[$((i + 1))]}

    done

    for i in ${!config[@]} 
    do
        echo $i ${config[$i]}
    done

    repo=${config[repository]}
    path=${config[vault_path]}
    obsidian_path=${config[obsidian_path]}
    repo_name=${config[repository_name]}
    user_name=${config[user_name]}
    user_email=${config[user_email]} 

}

push () {
    load_config
    if [[ ! -f "$HOME/.Obsidian/config" ]]; then
        echo "ERROR: config file is missing. Try init "
        else 
        cd $path/$repo_name
        timestamp=$(date +%D-%T)  
        git add .
        git commit -m "Uploaded notes $timestamp"
        git push origin main
        echo "Notes was successfully updated"
    fi
}

# $ obsidian init : this function generate the config file and requires all data 

if [[ "$flag" == "init" ]]; then

read -p "Enter your git repository link (https or ssh): " repo

read -p "Enter your email to link repo" user_email
read -p "Enter your email to link repo" user_name

path=$PWD
read -p "Is it vault to connect at $path ? [y/n] " des
  if [[ $des == "n" ]]; then 
    read -p "Please enter the vault directory: " path
    cd $path
  fi

echo "Downloading vault at $path from $repo"
git clone $repo 
echo "Creating config file at $config_path..."

  if [[ ! -f $config_path ]]; then
    cd $HOME
    mkdir .Obsidian 
    cd .Obsidian
    touch config
  else 
    echo "Requirement ~/.Obsidian/config already satisfiaced"
  fi 

echo "Enter the follow information to configure..."
read -p "Enter vault name" repo_name 
read -p "Enter obsidian path, (the file location or commnad to run obsidian) : " obsidian_path
save_config

fi

if [[ ! -f "$HOME/.Obsidian/config" ]]; then
  echo "ERROR: config file is missing. Try init "
else 
  load_config
  cd $path/$repo_name
  git config --local user.email "$user_email"
  git config --local user.name "$user_name"
  git pull origin main
  $obsidian_path
  timestamp=$(date +%D-%T)  
  git add .
  git commit -m "Uploaded notes $timestamp"
  git push origin main
  echo "Notes was successfully updated"
fi
 
