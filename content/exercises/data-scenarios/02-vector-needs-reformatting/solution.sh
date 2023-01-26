#!/usr/bin/env bash

# The data in a row looks like:
#     {
#         "x": -49.6612421393137,
#         "y": 64.619373319576695,
#         "cuteness_rating": 5.583,
#         "blood_acetone_grams_per_ml": 4.34e-06,
#         "blood_acetylcholine_grams_per_ml": 7.91e-08,
#     }
# ... but ogr2ogr doesn't know which fields are geometry fields.


ogr2ogr -f "GeoJSON" \
    -nln "kcbcc" \
    -nlt "POINT" \
    -dialect "sqlite" \
    -sql "SELECT ST_GeomFromText('POINT(' || x || ' ' || y || ')', 4326) geom, cuteness_rating, blood_acetone_grams_per_ml, blood_acetylcholine_grams_per_ml from Sheet1" \
    -a_srs "EPSG:4326" \
    "output.geojson" \
    "kcbcc_DS4_final_v2_final.xlsx"
