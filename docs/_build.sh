#!/bin/sh
cd docs
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
