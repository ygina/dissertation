.PHONY: all clean dist print

P = nsdi24

default : $P.pdf

$P.dvi	: $(wildcard *.tex *.bib figures/*.eps sections/* figures_tex/* tables/*)
	latex  $P < /dev/null || $(RM) $@
	bibtex $P < /dev/null || $(RM) $@
	latex  $P < /dev/null || $(RM) $@
	latex  $P < /dev/null || $(RM) $@

AGAIN = ! grep -q 'LaTeX Warning: .* Rerun' $P.log ||

$P.pdf  : $(wildcard *.tex *.bib figures/cwnd/* figures/* sections/* figures_tex/* tables/*)
	pdflatex -halt-on-error -file-line-error --shell-escape $P
	bibtex $P
	$(AGAIN) pdflatex -halt-on-error -file-line-error --shell-escape $P
	$(AGAIN) pdflatex -halt-on-error -file-line-error --shell-escape $P

$P.ps	: $P.dvi
	dvips -tletter -Ppdf $P.dvi -o $P.ps

$P.ps.gz: $P.ps
	$(RM) $P.ps.gz
	gzip -9 < $P.ps > $P.ps.gz

print:	$P.ps

dist:	$P.ps.gz

clean:
	$(RM) $P.log $P.aux $P.bbl $P.blg $P.out $P.dvi $P.ps $P.ps.gz $P.pdf \
		texput.log
