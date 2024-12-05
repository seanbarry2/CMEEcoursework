#!/bin/sh
# Author: Sean Barry sb4524@ic.ac.uk
# Script: boilerplate.sh
# Desc: simple boilerplate for shell scripts
# Arguments: none
# Date: Oct 2024

NumLines=`wc -l < $1`
echo "The file $1 has $NumLines lines"
echo
