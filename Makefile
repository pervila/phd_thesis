BASE=thesis.tex
NOPUBS=thesis_nopubs.tex

rubberPdf:
	rubber --warn=all --pdf $(BASE) 

rubberPdfNopubs:
	rubber --warn=all --pdf $(NOPUBS)

all: clean1 asarja rubberPdf clean2

asarja:
	rubber --pdf asarja.tex 

nopubs: clean1 asarja rubberPdfNopubs clean2

clean%:
	rm -f *.dvi *.aux *.log *.ent *.bbl *.blg *.ps *.toc *.pub *.out

transfer:
	chmod 0644 thesis.pdf
	rsync --perms thesis.pdf melkinpaasi.cs.helsinki.fi:public_html/phd/

tarball:
	tar cjf thesis.tar.bz2 thesis.tex thesis_nopubs.tex asarja.tex Makefile \
	  ack.tex publications_list.tex tssgpub.sty tktl_template/tktla.cls \
		tktla.cls figs/DC_air_flow_tall.eps refs.bib plainnat.bst
