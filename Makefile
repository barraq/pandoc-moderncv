SRC_DIR =  cv
BUILD_DIR = build
STYLES_DIR = styles
FONTS_DIR = $(STYLES_DIR)/fonts
SCAFFOLDS_DIR = scaffolds
IMAGES_DIR = $(SRC_DIR)/images
DIST_DIR = dist
DATE = $(shell date +'%B %d, %Y')

ifeq "$(wildcard $(SRC_DIR) )" ""
	PARTS_SOURCES=
else
	PARTS_SOURCES = $(shell find $(SRC_DIR) -name '*.md'  -not -name 'cv.md')
endif

PARTS = $(patsubst $(SRC_DIR)/%.md, $(BUILD_DIR)/%.html, $(PARTS_SOURCES))

# before-body contains public or private parts
before-body = --variable=privatecv
ifeq ($(private-cv),true)
	before-body = --variable=privatecv --include-before-body $(BUILD_DIR)/private.html
else
	ifeq ($(public-cv),true)
		before-body = --include-before-body $(BUILD_DIR)/public.html
	endif
endif

# after-body contains all parts but public and private
after-body = $(filter-out $(BUILD_DIR)/public.html $(BUILD_DIR)/private.html, $(PARTS))

.PHONY: all directories media style parts html pdf clean

# default target is build CV in html
all: html

# Targets for creating working directories
directories: $(BUILD_DIR) $(DIST_DIR)
$(BUILD_DIR):
	mkdir $(BUILD_DIR)
$(DIST_DIR):
	mkdir $(DIST_DIR)

# Targets for creating scaffold
scaffold:
ifeq "$(wildcard $(SRC_DIR) )" ""
	rsync -rupE $(SCAFFOLDS_DIR)/ $(SRC_DIR)/;
	@echo $(SRC_DIR) created, enjoy!;
else
	@echo $(SRC_DIR) already exists!;
endif

# Target for building stylesheets
style:
	compass compile $(STYLES_DIR)
	rsync -rupE $(STYLES_DIR)/stylesheets $(DIST_DIR)

# Target for media
media: | directories
	rsync -rupE $(FONTS_DIR) $(DIST_DIR)
	rsync -rupE $(IMAGES_DIR) $(DIST_DIR)

# Target for building CV document in html
html: media style templates/cv.html parts $(SRC_DIR)/cv.md | directories
	pandoc \
	--standalone \
	--section-divs \
	--smart \
	--template templates/cv.html \
	--from markdown+yaml_metadata_block+header_attributes+definition_lists \
	--to html5 \
	$(before-body) \
	$(after-body) \
	--variable=date:'$(DATE)' \
	--output $(DIST_DIR)/cv.html $(SRC_DIR)/cv.md

# Target for building CV document in PDF
pdf: html pdftags
	wkhtmltopdf \
	--encoding UTF-8 \
	--print-media-type \
	--orientation Portrait \
	--footer-html templates/footer.html \
	--page-size A4 \
	--margin-top 10 \
	--margin-left 10 \
	--margin-right 10 \
	--margin-bottom 10 \
	$(DIST_DIR)/cv.html $(DIST_DIR)/cv.pdf
	exiftool -overwrite_original $(shell cat $(BUILD_DIR)/pdftags.txt) $(DIST_DIR)/cv.pdf

pdftags: $(SRC_DIR)/cv.md
	pandoc \
	--from markdown+yaml_metadata_block \
	--template templates/pdf.metadata \
	--variable=date:'$(DATE)' \
	--output $(BUILD_DIR)/pdftags.txt $(SRC_DIR)/cv.md

# Target for build CV part in html
parts: $(PARTS)
$(PARTS): $(BUILD_DIR)/%.html: $(SRC_DIR)/%.md | directories
	pandoc \
	--section-divs \
	--from markdown+header_attributes \
	--variable=date:'$(DATE)' \
	--to html5 -o $@ $<

# Target for cleaning
clean:
	compass clean $(STYLES_DIR)
	rm -rf $(STYLES_DIR)/stylesheets
	rm -rf $(DIST_DIR)
	rm -rf $(BUILD_DIR)
