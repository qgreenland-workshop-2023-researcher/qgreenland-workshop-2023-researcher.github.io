#!/bin/bash

# ogr2ogr: https://gdal.org/programs/ogr2ogr.html
ogr2ogr \
    datafile_3413.gpkg \
    datafile.csv \
    -a_srs "EPSG:4326" \
    -t_srs "EPSG:3413" \
    -oo X_POSSIBLE_NAMES=lon* \
    -oo Y_POSSIBLE_NAMES=lat*
