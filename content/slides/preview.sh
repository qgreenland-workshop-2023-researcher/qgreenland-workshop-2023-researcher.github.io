#!/bin/bash
set -euo pipefail

if [ -z "${1-}" ]; then
    echo "Please pass the file to preview."
    exit 1
fi

THIS_DIR="$( cd "$(dirname "$0")"; pwd -P )"
DIST_DIR="${THIS_DIR}/_dist"
if [ -e "${DIST_DIR}" ]; then
    rm -rf "${DIST_DIR}"
    echo "Removed ${DIST_DIR}"
fi

# Trap INT and TERM and conver them to exit signal.
trap 'exit' INT TERM
# On exit, kill the process tree.
trap 'kill 0' EXIT

# Watch for changes in slide markdown files and touch the file being previewed
# when changes are detected. This will trigger quarto preview to do a hot
# reload. Normally it only reloads on changes to the file being previewed but
# not on changes to includes within that file.
while inotifywait -e delete -e create -e close_write $(find . -type f -name '*.qmd'); do
    echo "touch"
    touch "${1}"
done &

quarto preview "${1}"
