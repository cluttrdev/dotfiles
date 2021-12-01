#!/bin/sh

set -e

git config -f .gitmodules --get-regexp '^submodule\..*\.path$' |
    while read path_key path
    do
        url_key=$(echo $path_key | sed 's/\.path/.url/')
        url=$(git config -f .gitmodules --get "$url_key")
        branch_key=$(echo $path_key | sed 's/\.path/.branch/')
        branch=$(git config -f .gitmodules --get "$branch_key" || echo "master")
        echo "git submodule add -b $branch $url $path"
    done
