
# Program details -------------------------------------------------------------
TARGET      = main
PDFNAME     = thesis

# Compilers -------------------------------------------------------------------
PDFLATEX    = pdflatex
BIBTEX      = bibtex

# Source details --------------------------------------------------------------
CHAPTERS    = Chapters/*.tex
FIGURES     = Figures/*
APPENDICES  = Appendices/*.tex
SOURCES     = $(CHAPTERS) $(APPENDICES) $(FIGURES) variables.tex Thesis.cls

# Rules for compilation -------------------------------------------------------
.PHONY: all clean

# generate pdf
all: $(PDFNAME).pdf

# rename target pdf to desired pdf name
$(PDFNAME).pdf: $(TARGET).pdf
	cp $< $@

# generate the target pdf
$(TARGET).pdf: $(TARGET).tex $(TARGET)-blx.bib $(TARGET).toc $(SOURCES)
	$(PDFLATEX) $<

# generate toc
$(TARGET).toc: $(TARGET).tex $(CHAPTERS)
	$(PDFLATEX) $<

# generate bibliography
$(TARGET)-blx.bib: $(TARGET).tex Bibliography.bib
	$(PDFLATEX) $<
	$(BIBTEX) $(TARGET)

# remove the unwanted junk
clean:
	rm -rf main-blx.bib main.aux main.bbl main.blg main.glo main.ist main.lof \
		main.log main.lot main.out main.pdf main.run.xml main.toc thesis.pdf
