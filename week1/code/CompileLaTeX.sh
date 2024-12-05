#!/bin/sh
# Author: Sean Barry sb4524@ic.ac.uk
# Script: boilerplate.sh
# Desc: simple boilerplate for shell scripts
# Arguments: none
# Date: Oct 2024

pdflatex $1.tex
bibtex $1
pdflatex $1.tex
pdflatex $1.tex
evince $1.pdf &

## Cleanup
rm *.aux
rm *.log
rm *.bbl
rm *.blg
