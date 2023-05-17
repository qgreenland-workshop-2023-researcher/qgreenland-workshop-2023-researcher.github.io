#!/bin/bash

# Calculate the directory this script is in
THIS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

INPUT_FILE="${THIS_DIR}/../qgr_boundary_data.gpkg"
OUTPUT_FILE="${THIS_DIR}/qgr_boundary_data_4326.gpkg"

rm -f "${OUTPUT_FILE}"

# ogr2ogr: https://gdal.org/programs/ogr2ogr.html
# NOTE: Output file is first; this is weird but correct.
# NOTE: Segmentize is critical! It enables intermediate points to be created
#       between any two points that are too far apart. Here we are using a
#       distance threshold of 1000 meters (units are in the source projection).
ogr2ogr \
    "${OUTPUT_FILE}" \
    "${INPUT_FILE}" \
    -segmentize 1000 \
    -t_srs "EPSG:4326"
