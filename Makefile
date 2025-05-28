default:
	mkdir -p build/
	xelatex  -output-directory build/ src2/test_latex.tex
	cp src2/test.bib build/
	cp styles/belarus-specific-utf8gost780u.bst build/
	cd build/ ; bibtex test_latex
	xelatex  -output-directory build/ src2/test_latex.tex
	xelatex  -output-directory build/ src2/test_latex.tex

clean:
	rm -r build/

open:
	xdg-open build/test_latex.pdf
