#!/usr/bin/env bash

THIS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INPUT_FILE="${THIS_DIR}/kcbcc_DS4_final_v2_final.vrt"
OUTPUT_FILE="${THIS_DIR}/output.geojson"

# Remove the output file if it already exists.
rm -f $OUTPUT_FILE

# ogr2ogr vrt driver: https://gdal.org/drivers/vector/vrt.html
ogr2ogr \
    -nln "kcbcc" \
    output.geojson \
    kcbcc_DS4_final_v2_final.vrt
