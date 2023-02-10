#!/usr/bin/env bash
set -euo pipefail

# Check spelling on markdown files, but ignore some ephemeral files (e.g.
# Quarto stuff) and files from external sources (e.g. Code of Conduct, node
# modules)
npx mdspell --en-us --ignore-numbers --ignore-acronyms --report \
    $(find . \
        -not -path './CODE_OF_CONDUCT.md' \
        -not -path './node_modules/*' \
        -not -path '*/_dist/*' \
        -not -path '*/.quarto/*' \
        -not -path '*/notes/*' \
        -regex '.*.[q]?md')
