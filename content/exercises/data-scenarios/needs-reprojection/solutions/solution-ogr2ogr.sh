#!/bin/bash

THIS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

INPUT_FILE="${THIS_DIR}/../datafile.csv"
OUTPUT_FILE="${THIS_DIR}/datafile_3413.gpkg"

rm -f "${OUTPUT_FILE}"

# ogr2ogr: https://gdal.org/programs/ogr2ogr.html
# NOTE: Output file is first; this is weird but correct.
ogr2ogr \
    "${OUTPUT_FILE}" \
    "${INPUT_FILE}" \
    -a_srs "EPSG:4326" \
    -t_srs "EPSG:3413" \
    -oo X_POSSIBLE_NAMES=lon* \
    -oo Y_POSSIBLE_NAMES=lat*
