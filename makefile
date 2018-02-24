SOURCE        := scp.tex
VERSION       := $(shell sed -n '/vhEntry/{n;p;}' changelog.tex | tail -n 1 | sed -nr 's/^\{([^}]+)\}.*/\1/p')
LATEXMKFLAG   := -quiet -xelatex
OUTDIR        := build
LATEXMKOUTDIR := -jobname=build

$(info !!! Current version: ${VERSION})

scp.pdf:
	$(info !!! Building test version: $@ ...)
	latexmk $(LATEXMKFLAG) ${SOURCE}

checkclean:
	$(info !!! Checking if git repo is clean...)
	@git diff --exit-code > /dev/null
	@git diff --cached --exit-code > /dev/null

define build
	$(info !!! Set target to $(1))
        @sed -i -r -e 's/targetdevice\{(.*)\}/targetdevice{$(1)}/g' ${SOURCE}
        $(info !!! Set font to $(2))
        @sed -i -r -e 's/targetfonts\{(.*)\}/targetfonts{$(2)}/g' ${SOURCE}
        $(info !!! Building $@ ...)
        latexmk $(LATEXMKFLAG) $(LATEXMKOUTDIR)/$(3) ${SOURCE}
	git checkout -- $(SOURCE)
	mv $(OUTDIR)/$(3).pdf $(OUTDIR)/$(3)
	find $(OUTDIR) -type f -not -name "*.pdf" -delete
endef

scp.pc.notofira.$(VERSION).pdf: checkclean
	$(call build,pc,notofira,$@)

scp.pc.sarasa.$(VERSION).pdf: checkclean
	$(call build,pc,sarasa,$@)

scp.kindle.notofira.$(VERSION).pdf: checkclean
	$(call build,kindle,notofira,$@)

scp.kindle.sarasa.$(VERSION).pdf: checkclean
	$(call build,kindle,sarasa,$@)

$(OUTDIR):
	@mkdir -p $(OUTDIR)

all: $(OUTDIR) scp.pc.notofira.$(VERSION).pdf scp.pc.sarasa.$(VERSION).pdf scp.kindle.notofira.$(VERSION).pdf scp.kindle.sarasa.$(VERSION).pdf
