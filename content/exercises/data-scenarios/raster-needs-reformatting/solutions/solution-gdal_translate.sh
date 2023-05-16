#!/bin/bash

# Calculate the directory this script is in
THIS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

INPUT_FILE="${THIS_DIR}/../datafile.jpg"
OUTPUT_FILE="${THIS_DIR}/datafile.tif"
PROJECTION_DEFINITION_FILE="${THIS_DIR}/../datafile.prj"

# Remove the output file if it already exists.
rm -f $OUTPUT_FILE

gdal_translate -a_srs $PROJECTION_DEFINITION_FILE -a_ullr -334334.200 -1855796.425 -327188.537 -1860658.423 $INPUT_FILE $OUTPUT_FILE
