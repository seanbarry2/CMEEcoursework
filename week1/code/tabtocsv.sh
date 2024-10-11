#!/bin/sh
# Author: Sean Barry sb4524@ic.ac.uk
# Script: tabtocsv.sh
# Description: substitute the tabs in the files with commas
#
# Saves the output into a .csv file
# Arguments: 1 -> tab delimited file
# Date: Oct 2024

if [ -z "$1" ]; then
  echo "Error: No input file provided."
  echo "Usage: $0 <input_file>"
  exit 1
fi

if [ ! -f "$1" ]; then
  echo "Error: File '$1' not found."
  exit 1
fi

echo "Creating a comma delimited version of $1 ..."
cat $1 | tr -s "\t" "," >> $1.csv
echo "Done!"
exit
