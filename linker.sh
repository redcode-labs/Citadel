#!/bin/bash
dir=$1
prefix=""
if (( $# > 1 )); then
    prefix=$2
fi
for executable in $(find $dir/ -executable); do
    link_name=$(echo $executable|awk -F'/' '{print $NF}'|awk -F',' '{print $1}')
    ln -sf $executable $prefix$link_name
done