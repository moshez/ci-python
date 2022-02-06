#!/bin/sh
set -ex
TALK=talk
mkdir -p build
cp $TALK.ipynb build/
cd build
jupyter nbconvert $TALK.ipynb --to markdown \
	--TagRemovePreprocessor.remove_cell_tags='{"no_markdown"}'  \
	--TagRemovePreprocessor.remove_all_outputs_tags='{"no_output"}'  \
	--output $TALK.md
pandoc --listings -o $TALK.tex $TALK.md 
mf beamer --input $TALK.tex --outdir .
pdflatex talk.tex
pdflatex handout.tex

