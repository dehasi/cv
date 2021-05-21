.PHONY: work
work:
	lualatex cv.tex
	lualatex cv2.tex
galeyev_java_cv.pdf: cv.tex
	lualatex -jobname=$(basename $@) $<

.PHONY: contacts
contacts:
	@if [ "${EMAIL}" = "" ]; then echo "EMAIL is not set"; exit 11; fi
	@if [ "${PHONE}" = "" ]; then echo "PHONE is not set"; exit 22; fi
	sed -i.bak "s/xxxxxxxx@gmail.com/${EMAIL}/" cv.tex
	sed -i.bak "s/+31 123 456 789/${PHONE}/" cv.tex

.PHONY: clean
clean:
	rm -f *.png *.aux *log *.pdf *.out *.bcf *.xml *.bak

.PHONY: healthcheck
healthcheck:
	@which -s pdflatex || echo "pdflatex is not installed"
