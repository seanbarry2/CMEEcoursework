#!/bin/sh
# Author: Sean Barry sb4524@ic.ac.uk
# Script: tabtocsv.sh
# Description: substitute the tabs in the files with commas
#
# Replaces commas with spaces
# Arguments: 1 -> csv delimited file
# Date: Oct 2024

echo "Creating a comma delimited version of $1 ..."
cat $1 | tr -s "," " " >> ${1%.csv}_spacedelim.txt
echo "Done!"
exit
