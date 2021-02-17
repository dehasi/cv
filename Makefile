cv.pdf: cv.tex
	pdflatex cv.tex

.PHONY: clean
clean:
	rm -f *.png *.aux *log *.pdf *.out *.bcf *.xml

.PHONY: healthcheck
healthcheck:
	@which -s pdflatex || echo "pdflatex is not installed"
