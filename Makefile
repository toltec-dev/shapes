all: example.pdf example.svg
.PHONY: all

example.pdf: example.tex
	latexmk -xelatex -output-directory=build "$^"
	mv build/"$@" "$@"
	rm -r build

example.svg: example.pdf
	inkscape "$^" --export-plain-svg --export-filename "$@"
