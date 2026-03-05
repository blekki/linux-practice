#!/bin/bash

function add { echo "$1 + $2 = $(($1 + $2))"; }
function sub { echo "$1 - $2 = $(($1 - $2))"; }

method=""

# flags analyzer
while getopts "as" opt; do
    case $opt in
        "a") method="add";;
        "s") method="sub";;
        "\?");;
    esac
done
shift $((OPTIND - 1))

# run math
if [ "$method" == "add" ]; then
    add $1 $2
elif [ "$method" == "sub" ]; then
    sub $1 $2
fi