.PHONY: examples

CC = xelatex

EXAMPLES_DIR = examples

RESUME_EXAMPLE_DIR = examples/resume
CV_EXAMPLE_DIR = examples/cv
RESUME_DIR = resume

RESUME_EXAMPLE_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_EXAMPLE_SRCS = $(shell find $(CV_DIR) -name '*.tex')
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')

examples: $(foreach x, coverletter cv resume, examples/$x.pdf)

examples/resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_EXAMPLE_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

examples/cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_EXAMPLE_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

examples/coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

resume/resume.pdf: $(RESUME_SRCS)
	$(CC) -output-directory=$(RESUME_DIR) resume/resume.tex

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf $(RESUME_DIR)/*.pdf
