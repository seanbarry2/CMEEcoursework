#!/bin/sh
# Author: Sean Barry sb4524@ic.ac.uk
# Arguments: none
# Date: Oct 2024

for f in *.tif; 
    do  
        echo "Converting $f"; 
        convert "$f"  "$(basename "$f" .tif).png"; 
    done
