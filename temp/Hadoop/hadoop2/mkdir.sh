#!/bin/sh

dir="/app/hadoop"
echo "$dir"

mkdir -p ${dir}
chown -R hadoop:hadoop ${dir}


