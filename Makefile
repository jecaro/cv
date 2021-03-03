.PHONY: examples

CC = xelatex
CC_OPTS = -interaction=nonstopmode -halt-on-error

EXAMPLES_DIR = examples

RESUME_EXAMPLE_DIR = examples/resume
CV_EXAMPLE_DIR = examples/cv
RESUME_FR_DIR = resume-fr
RESUME_EN_DIR = resume-en

AWESOME_SRCS = awesome-cv.cls fontawesome.sty

RESUME_EXAMPLE_SRCS = $(shell find $(RESUME_EXAMPLE_DIR) -name '*.tex')
CV_EXAMPLE_SRCS = $(shell find $(CV_DIR) -name '*.tex')
RESUME_FR_SRCS = $(shell find $(RESUME_FR_DIR) -name '*.tex')
RESUME_EN_SRCS = $(shell find $(RESUME_EN_DIR) -name '*.tex')

CVS = $(RESUME_FR_DIR)/jeancharles.quillet-fr.pdf $(RESUME_EN_DIR)/jeancharles.quillet-en.pdf

out ?= ./output

all: $(CVS)

install: $(CVS)
	install -D $? -t $(out)

$(RESUME_FR_DIR)/jeancharles.quillet-fr.pdf: $(RESUME_FR_SRCS) $(AWESOME_SRCS)
	$(CC) $(CC_OPTS) -output-directory=$(@D) -jobname=$(basename $(@F)) $(RESUME_FR_DIR)/resume.tex

$(RESUME_EN_DIR)/jeancharles.quillet-en.pdf: $(RESUME_EN_SRCS) $(AWESOME_SRCS)
	$(CC) $(CC_OPTS) -output-directory=$(@D) -jobname=$(basename $(@F)) $(RESUME_EN_DIR)/resume.tex

examples: $(foreach x, coverletter cv resume, examples/$x.pdf)

examples/resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_EXAMPLE_SRCS) $(AWESOME_SRCS)
	$(CC) $(CC_OPTS) -output-directory=$(EXAMPLES_DIR) $<

examples/cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_EXAMPLE_SRCS) $(AWESOME_SRCS)
	$(CC) $(CC_OPTS) -output-directory=$(EXAMPLES_DIR) $<

examples/coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex $(AWESOME_SRCS)
	$(CC) $(CC_OPTS) -output-directory=$(EXAMPLES_DIR) $<

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf $(RESUME_FR_DIR)/*.pdf $(RESUME_EN_DIR)/*.pdf
