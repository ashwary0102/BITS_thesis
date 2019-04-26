# Program details -------------------------------------------------------------
TARGET      = main
PDFNAME     = thesis

# Compilers -------------------------------------------------------------------
LATEX       = latex
LATEXMK     = latexmk
PDFLATEX    = pdflatex
BIBTEX      = bibtex


# Rules for compilation -------------------------------------------------------

# generate pdf
all: $(PDFNAME).pdf

# rename target pdf to desired pdf name
$(PDFNAME).pdf: $(TARGET).pdf
	cp $< $@

# generate the target pdf
$(TARGET).pdf: $(TARGET).tex $(TARGET)-blx.bib $(TARGET).toc
	$(PDFLATEX) $(TARGET).tex

# generate bibliography
$(TARGET)-blx.bib: $(TARGET).tex Bibliography.bib
	$(PDFLATEX) $(TARGET).tex
	$(BIBTEX) $(TARGET)
