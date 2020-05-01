SOURCE        := scp.tex
LATEXMKFLAG   := -quiet -f -xelatex
LATEXMKOUTDIR := -jobname=
UNAME         := $(shell uname)
SED           := sed

ifeq ($(UNAME),Darwin)
	SED = gsed
endif

VERSION       := $(shell $(SED) -n '/vhEntry/{n;p;}' changelog.tex | tail -n 1 | $(SED) -nr 's/^\{([^}]+)\}.*/\1/p')

$(info !!! Current version: $(VERSION))

scp.pdf:
	$(info !!! Building test version: $(VERSION) ...)
	@latexmk $(LATEXMKFLAG) ${SOURCE}

define build
	$(info !!! Set target to $(1))
	$(info !!! Set font to $(2))
	@$(SED) -r -e 's/targetdevice\{(.*)\}/targetdevice{$(1)}/g' \
       		-e 's/targetfonts\{(.*)\}/targetfonts{$(2)}/g' \
       		${SOURCE} > $(3).tex
	$(info !!! Building $(3) ...)
	@latexmk $(LATEXMKFLAG) $(LATEXMKOUTDIR)$(3) $(3).tex
	@mv $(3).pdf $(3)
	@rm $(3).tex
endef

pc.notofira: scp.pc.notofira.v$(VERSION).pdf
pc.sarasa: scp.pc.sarasa.v$(VERSION).pdf
kindle.notofira: scp.kindle.notofira.v$(VERSION).pdf
kindle.sarasa: scp.kindle.sarasa.v$(VERSION).pdf
op3.notofira: scp.op3.notofira.v$(VERSION).pdf
op3.sarasa: scp.op3.sarasa.v$(VERSION).pdf

scp.pc.notofira.v$(VERSION).pdf: $(BUILDDIR)
	$(call build,pc,notofira,$@)

scp.pc.sarasa.v$(VERSION).pdf: $(BUILDDIR)
	$(call build,pc,sarasa,$@)

scp.kindle.notofira.v$(VERSION).pdf: $(BUILDDIR)
	$(call build,kindle,notofira,$@)

scp.kindle.sarasa.v$(VERSION).pdf: $(BUILDDIR)
	$(call build,kindle,sarasa,$@)

scp.op3.notofira.v$(VERSION).pdf: $(BUILDDIR)
	$(call build,op3,notofira,$@)

scp.op3.sarasa.v$(VERSION).pdf: $(BUILDDIR)
	$(call build,op3,sarasa,$@)


all: pc.notofira pc.sarasa kindle.notofira kindle.sarasa op3.notofira op3.sarasa

clean:
	git clean -dfX

cleanpdf:
	-rm *.pdf

cleanall: clean cleanpdf

