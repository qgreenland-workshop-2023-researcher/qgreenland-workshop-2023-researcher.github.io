#!/usr/bin/env bash
set -eu

THIS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

INPUT_FILE="${THIS_DIR}/../dem_without_metadata.tif"
OUTPUT_FILE="${THIS_DIR}/dem_with_metadata.tif"

# gdal_translate: Convert raster data between different formats
#     https://gdal.org/programs/gdal_translate.html
gdal_translate \
    -a_srs "+proj=stere +lat_0=90 +lat_ts=71 +lon_0=-39 +x_0=0 +y_0=0 +a=6378137 +rf=298.257024882273 +units=m +no_defs" \
    -a_ullr -802500.000 -597500.000 702500.000 -3402500.000 \
    "${INPUT_FILE}" "${OUTPUT_FILE}"

# Alternately, `gdal_edit.py` can do this in-place, modifying the original data
# file.
# gdal_edit.py: Edit, in place, various information of an existing GDAL dataset
#     https://gdal.org/programs/gdal_edit.html
