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

define finish_build
	git checkout -- $(SOURCE)
	mv $(OUTDIR)/$(1).pdf $(OUTDIR)/$(1)
endef

scp.pc.notofira.$(VERSION).pdf: checkclean
	$(info !!! Set target to PC)
	@sed -i -r -e 's/targetdevice\{(.*)\}/targetdevice{pc}/g' ${SOURCE}
	$(info !!! Set Font to Noto+Fira)
	@sed -i -r -e 's/targetfonts\{(.*)\}/targetfonts{notofira}/g' ${SOURCE}
	$(info !!! Building $@ ...)
	latexmk $(LATEXMKFLAG) $(LATEXMKOUTDIR)/$@ ${SOURCE}
	$(call finish_build,$@)

scp.pc.sarasa.$(VERSION).pdf: checkclean
	$(info !!! Set target to PC)
	@sed -i -r -e 's/targetdevice\{(.*)\}/targetdevice{pc}/g' ${SOURCE}
	$(info !!! Set font to Sarasa)
	@sed -i -r -e 's/targetfonts\{(.*)\}/targetfonts{sarasa}/g' ${SOURCE}
	$(info !!! Building $@ ...)
	latexmk $(LATEXMKFLAG) $(LATEXMKOUTDIR)/$@ ${SOURCE}
	$(call finish_build,$@)

scp.kindle.notofira.$(VERSION).pdf: checkclean
	$(info !!! Set target to Kindle)
	@sed -i -r -e 's/targetdevice\{(.*)\}/targetdevice{kindle}/g' ${SOURCE}
	$(info !!! Set font to Noto+Fira)
	@sed -i -r -e 's/targetfonts\{(.*)\}/targetfonts{notofira}/g' ${SOURCE}
	$(info !!! Building $@ ...)
	latexmk $(LATEXMKFLAG) $(LATEXMKOUTDIR)/$@ ${SOURCE}
	$(call finish_build,$@)

scp.kindle.sarasa.$(VERSION).pdf: checkclean
	$(info !!! Set target to Kindle)
	@sed -i -r -e 's/targetdevice\{(.*)\}/targetdevice{kindle}/g' ${SOURCE}
	$(info !!! Set font to Sarasa)
	@sed -i -r -e 's/targetfonts\{(.*)\}/targetfonts{sarasa}/g' ${SOURCE}
	$(info !!! Building $@ ...)
	latexmk $(LATEXMKFLAG) $(LATEXMKOUTDIR)/$@ ${SOURCE}
	$(call finish_build,$@)

$(OUTDIR):
	@mkdir -p $(OUTDIR)

all: $(OUTDIR) scp.pc.notofira.$(VERSION).pdf scp.pc.sarasa.$(VERSION).pdf scp.kindle.notofira.$(VERSION).pdf scp.kindle.sarasa.$(VERSION).pdf
