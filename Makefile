.PHONY: examples

CC = xelatex
BUILD_DIR := examples
RESUME_DIR = $(BUILD_DIR)/resume
CV_DIR = $(BUILD_DIR)/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

examples: $(foreach x, coverletter cv resume, $x.pdf)

resume.pdf: $(BUILD_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(BUILD_DIR) $<

cv.pdf: $(BUILD_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(BUILD_DIR) $<

coverletter.pdf: $(BUILD_DIR)/coverletter.tex
	$(CC) -output-directory=$(BUILD_DIR) $<

clean:
	rm -rf $(BUILD_DIR)/*.pdf
