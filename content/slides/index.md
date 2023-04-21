---
title: "Slides"
listing:
  type: "table"
  contents:
    - "*.md"
    - "*.qmd"
  fields:
    - "title"
  sort: ["index", "title"]
format:
  html: default
  revealjs:
    # Hack: the `_metadata.yml` sets all files in this directory as `revealjs` format.
    # Without having this set, we get a `NotFound` error when using `quarto render`.
    output-file: "slides_duplicate_index.html"
---

_TODO: Add metadata to slides so they can be displayed with / sorted by module
identifier_
