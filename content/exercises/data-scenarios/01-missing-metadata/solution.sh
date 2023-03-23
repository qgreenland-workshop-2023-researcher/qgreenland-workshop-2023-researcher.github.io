#!/usr/bin/env bash

# Make a copy of the data that we will apply edits to.
cp bamber_greenland_dem.tif bamber_greenland_dem_edited.tif

# gdal_edit.py: Edit, in place, various information of an existing GDAL dataset
#     https://gdal.org/programs/gdal_edit.html
gdal_edit.py \
    -a_srs "+proj=stere +lat_0=90 +lat_ts=71 +lon_0=-39 +x_0=0 +y_0=0 +a=6378137 +rf=298.257024882273 +units=m +no_defs" \
    -a_ullr -802500.000 -597500.000 702500.000 -3402500.000 \
    bamber_greenland_dem_edited.tif
