SOURCE        := scp.tex
VERSION       := $(shell sed -n '/vhEntry/{n;p;}' changelog.tex | tail -n 1 | sed -nr 's/^\{([^}]+)\}.*/\1/p')
LATEXMKFLAG   := -quiet -xelatex
LATEXMKOUTDIR := -jobname=

$(info !!! Current version: ${VERSION})

scp.pdf: $(BUILDDIR)
	$(info !!! Building test version: $ ...)
	latexmk $(LATEXMKFLAG) ${SOURCE}

define build
	$(info !!! Set target to $(1))
	$(info !!! Set font to $(2))
	@sed -r -e 's/targetdevice\{(.*)\}/targetdevice{$(1)}/g' -e 's/targetfonts\{(.*)\}/targetfonts{$(2)}/g' ${SOURCE} > $(3).tex
	$(info !!! Building $(3) ...)
	@latexmk $(LATEXMKFLAG) $(LATEXMKOUTDIR)$(3) $(3).tex
	@mv $(3).pdf $(3)
	rm $(3).tex
endef

scp.pc.notofira.$(VERSION).pdf: $(BUILDDIR)
	$(call build,pc,notofira,$@)

scp.pc.sarasa.$(VERSION).pdf: $(BUILDDIR)
	$(call build,pc,sarasa,$@)

scp.kindle.notofira.$(VERSION).pdf: $(BUILDDIR)
	$(call build,kindle,notofira,$@)

scp.kindle.sarasa.$(VERSION).pdf: $(BUILDDIR)
	$(call build,kindle,sarasa,$@)

$(BUILDDIR):
	@mkdir -p $(BUILDDIR)

all: scp.pc.notofira.$(VERSION).pdf scp.pc.sarasa.$(VERSION).pdf scp.kindle.notofira.$(VERSION).pdf scp.kindle.sarasa.$(VERSION).pdf

clean:
	git clean -dfX

cleanpdf:
	-rm *.pdf

cleanall: clean cleanpdf

