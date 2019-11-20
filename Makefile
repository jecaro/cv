.PHONY: examples

CC = xelatex
CC_OPTS = -interaction=nonstopmode -halt-on-error

EXAMPLES_DIR = examples

RESUME_EXAMPLE_DIR = examples/resume
CV_EXAMPLE_DIR = examples/cv
RESUME_FR_DIR = resume-fr

AWESOME_SRCS = awesome-cv.cls fontawesome.sty

RESUME_EXAMPLE_SRCS = $(shell find $(RESUME_EXAMPLE_DIR) -name '*.tex')
CV_EXAMPLE_SRCS = $(shell find $(CV_DIR) -name '*.tex')
RESUME_FR_SRCS = $(shell find $(RESUME_FR_DIR) -name '*.tex')

resume-fr/jeancharles.quillet-fr.pdf: $(RESUME_SRCS) $(AWESOME_SRCS)
	$(CC) $(CC_OPTS) -output-directory=$(@D) -jobname=$(basename $(@F)) resume-fr/resume.tex

examples: $(foreach x, coverletter cv resume, examples/$x.pdf)

examples/resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_EXAMPLE_SRCS) $(AWESOME_SRCS)
	$(CC) $(CC_OPTS) -output-directory=$(EXAMPLES_DIR) $<

examples/cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_EXAMPLE_SRCS) $(AWESOME_SRCS)
	$(CC) $(CC_OPTS) -output-directory=$(EXAMPLES_DIR) $<

examples/coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex $(AWESOME_SRCS)
	$(CC) $(CC_OPTS) -output-directory=$(EXAMPLES_DIR) $<

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf $(RESUME_DIR)/*.pdf
