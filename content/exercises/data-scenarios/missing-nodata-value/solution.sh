#!/usr/bin/env bash
set -eu

# NOTE: `gdal_edit` will modify a file in place, so we create a copy first.
cp bambgrl_dem_5km_corrected.tif filled.tif

gdal_edit.py -a_nodata -0.1 filled.tif
