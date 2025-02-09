#!/bin/bash

# this script will create a list and let the user read it

# check if the directory exists, if it does not create it

if [ ! -d ~/lists ]; then
    echo "the directory does not exists, creating it now at ~/lists"
    mkdir -p ~/lists
fi


# if no arguemnt is given, the command will exit with a default message
if [ $# -eq 0 ]; then
    echo "pass the following arguments:"
    echo "[create] [list-name] to create a list"
    echo "[read] [list-name] to read a list"
    echo "[add] [list-name] [item] to add an item to a list"
    echo "[delete] [list-name] to delete a list"
    echo "[lists] to list all the lists"
    exit 1
fi


if [ $1 == "create" ]; then
    touch ~/lists/$2.txt
    echo "list $2 created"
fi


if [ $1 == "read" ]; then
    cat ~/lists/$2.txt
fi

if [ $1 == "delete" ]; then
    rm ~/lists/$2.txt
    echo "list $2 deleted"
fi

if [ $1 == "add" ]; then
    echo $3 >> ~/lists/$2.txt
    echo "item $3 added to list $2"
fi

if [ $1 == "lists" ]; then
    ls ~/lists
fi


