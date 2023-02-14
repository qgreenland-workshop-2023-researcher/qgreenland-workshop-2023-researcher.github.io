#!/usr/bin/env bash
set -euo pipefail

if [ "${1-}" = "-i" ]; then
    # Suggestions are super slow, so we want them disabled in interactive mode.
    REPORT_MODE="--no-suggestions"
else
    REPORT_MODE="--report"
fi

# Check spelling on markdown files, but ignore some ephemeral files (e.g.
# Quarto stuff) and files from external sources (e.g. Code of Conduct, node
# modules)
npx mdspell --en-us --ignore-numbers --ignore-acronyms ${REPORT_MODE} \
    $(find . \
        -not -path './CODE_OF_CONDUCT.md' \
        -not -path './node_modules/*' \
        -not -path '*/_dist/*' \
        -not -path '*/.quarto/*' \
        -not -path '*/notes/*' \
        -regex '.*.[q]?md')
