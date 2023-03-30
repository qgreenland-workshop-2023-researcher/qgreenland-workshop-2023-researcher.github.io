#!/usr/bin/env bash
set -eu

THIS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

INPUT_FILE="${THIS_DIR}/../bambgrl_dem_5km_corrected.tif"
OUTPUT_FILE="${THIS_DIR}/with_nodata_value.tif"

rm -f "${OUTPUT_FILE}"

# NOTE: `gdal_edit` will modify a file in place, so we create a copy first.
cp "${INPUT_FILE}" "${OUTPUT_FILE}"

gdal_edit.py -a_nodata -0.1 "${OUTPUT_FILE}"
