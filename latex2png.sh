#!/bin/bash
pdflatex main.tex 
pdftoppm -png -q -f 1 -singlefile main.pdf main
rm main.tex -f
rm main.aux -f
rm main.log -f
rm main.pdf -f
#rm main.pdf -f
