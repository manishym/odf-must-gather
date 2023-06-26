#!/usr/bin/env bash

#
# Please Note:
# While using bash variables inside the functions defined here,
# ensure that the variable has been defined before,
# you call the realted helper function.
#

dbglog() {
    # Allow the input to be piped
    declare msg=${1:-$(</dev/stdin)}

    echo -e "${msg}" | tee -a "${BASE_COLLECTION_PATH}"/gather-debug.log
}

# Works similar to dbglog but accepts a custom file name as an arg
# 1st arg is the file name to write to
# 2nd arg is the message to append
dbglogf() {
    # Allow the input to be piped
    declare msg=${2:-$(</dev/stdin)}

    if [[ -z $1 || -z $msg ]]; then
        echo "dbglogf: Not enough args to call the function."
        exit 1
    fi

    echo -e "${msg}" | tee -a "${1}"
}
