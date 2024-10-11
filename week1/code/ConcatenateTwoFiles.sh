#!/bin/bash
if [ "$#" -lt 2 ]; then
  echo "Error: At least two input files are required."
  echo "Usage: $0 <input_file1> <input_file2> [output_file]"
  exit 1
fi

if [ ! -f "$1" ]; then
  echo "Error: File '$1' not found."
  exit 1
fi

if [ ! -f "$2" ]; then
  echo "Error: File '$2' not found."
  exit 1
fi

cat $1 > $3
cat $2 >> $3
echo "Merged File is"
cat $3
