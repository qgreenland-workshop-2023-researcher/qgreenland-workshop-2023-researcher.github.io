#!/usr/bin/env bash
set -eu

THIS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

INPUT_FILE="${THIS_DIR}/../bambgrl_dem_5km_corrected.tif"
OUTPUT_FILE="${THIS_DIR}/with_nodata_value.tif"

# gdal_translate: Convert raster data between different formats
#     https://gdal.org/programs/gdal_translate.html
gdal_translate \
    -a_nodata -0.1 \
    "${INPUT_FILE}" "${OUTPUT_FILE}"

# Alternately, `gdal_edit.py` can do this in-place, modifying the original data
# file.
# gdal_edit.py: Edit, in place, various information of an existing GDAL dataset
#     https://gdal.org/programs/gdal_edit.html
