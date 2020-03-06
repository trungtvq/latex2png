#!/bin/bash
pdflatex main.tex 
cp main.pdf output
pdftoppm -png -q -f 1 -singlefile main.pdf output/
rm main.tex -f
rm main.aux -f
rm main.log -f
#rm main.pdf -f
