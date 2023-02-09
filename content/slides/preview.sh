#!/bin/bash
set -euo pipefail


while inotifywait -e delete -e create -e close_write $(find . -type f -name '*.qmd'); do
    echo "touch"
    touch day-1.qmd
done
