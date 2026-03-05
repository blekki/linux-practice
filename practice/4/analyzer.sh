#!/bin/bash

VALID_FILE="source.txt"
NOT_VALID_FILE="not-valid-file.txt"
CODE_OK=0

# flags analyzer
while getopts "vn" opt; do
    case $opt in
        v) FILE="source.txt";;
        n) FILE="not-valid-value";;
        \?) ;;
    esac
done
shift $((OPTIND - 1))

: ${FILE:="not-valid-value"}    # init var if it's empty

# catch errors
cat $FILE > /dev/null 2>&1
if [ $? -eq $CODE_OK ]; then
    echo "PASSED"
else
    echo "FAILED (Code: $?)"
fi