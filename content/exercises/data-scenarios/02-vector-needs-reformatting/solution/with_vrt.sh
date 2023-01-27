#!/usr/bin/env bash

# ogr2ogr vrt driver: https://gdal.org/drivers/vector/vrt.html
ogr2ogr \
    -nln "kcbcc" \
    output.geojson \
    kcbcc_DS4_final_v2_final.vrt
