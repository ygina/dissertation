.PHONY: main.pdf

paper.pdf:
	latexrun/latexrun -W no-unbalanced -W no-overfull main.tex

clean:
	rm -rf latex.out
	latexmk -C
