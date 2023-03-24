#!/usr/bin/env bash
set -eu

# NOTE: `gdal_edit` will modify a file in place, so we create a copy first.
cp bambgrl_dem_5km_corrected.tif with_nodata_value.tif

gdal_edit.py -a_nodata -0.1 with_nodata_value.tif
