#!/usr/bin/env bash

THIS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INPUT_FILE="${THIS_DIR}/../kcbcc_DS4_final_v2_final.xlsx"
OUTPUT_FILE="${THIS_DIR}/output.geojson"

# Remove the output file if it already exists.
rm -f $OUTPUT_FILE

# The data in a row looks like:
#     {
#         "x": -49.6612421393137,
#         "y": 64.619373319576695,
#         "cuteness_rating": 5.583,
#         "blood_acetone_grams_per_ml": 4.34e-06,
#         "blood_acetylcholine_grams_per_ml": 7.91e-08,
#     }
# ... but ogr2ogr doesn't know which fields are geometry fields.

# ogr2ogr: https://gdal.org/programs/ogr2ogr.html
ogr2ogr -f "GeoJSON" \
    -nln "kcbcc" \
    -nlt "POINT" \
    -dialect "sqlite" \
    -sql "SELECT ST_GeomFromText('POINT(' || x || ' ' || y || ')', 4326) geom, cuteness_rating, blood_acetone_grams_per_ml, blood_acetylcholine_grams_per_ml from Sheet1" \
    -a_srs "EPSG:4326" \
    -overwrite \
    $OUTPUT_FILE \
    $INPUT_FILE
