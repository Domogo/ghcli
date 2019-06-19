#!/bin/bash

function create() {
    repo_name=$1
    cd
    cd Projects/
    # get authkey and username from .cc_config
    v=$(cat create-command/.cc_config)
    authkey="$(echo $v | cut -d';' -f1)"
    username="$(echo $v | cut -d';' -f2)"
    
    # Use github api to create a repo
    curl -d '{"name": "'"${repo_name}"'", "auto_init": "true"}' -H "Content-Type: application/json" -H "Authorization: Bearer ${authkey}" -X POST https://api.github.com/user/repos
    
    git clone git@github.com:${username}/${repo_name}.git
    cd ${repo_name}

}