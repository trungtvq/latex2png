#!/bin/bash
pdflatex $1.tex 
pdftoppm -png -q -f 1 -singlefile $1.pdf $1
rm $1.tex -f
rm $1.aux -f
rm $1.log -f
rm $1.pdf -f
