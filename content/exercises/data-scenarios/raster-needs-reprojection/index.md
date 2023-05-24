---
title: "Data Scenario: Raster data needs reprojection"
categories: ["Data transformation"]
listing:
  id: "file-listing"
  type: "table"
  sort-ui: false
  filter-ui: false
  contents:
    - "*[!.ipynb]"
---

:::{#file-listing}
:::


Your team needs a DEM of Greenland for a global analysis processing pipeline
that requires a WGS-84 geographic projection (`EPSG:4326`). Your team selected
the included modified data file,
[dem_with_altered_metadata.tif](/content/exercises/data-scenarios/raster-needs-reprojection/dem_with_altered_metadata.tif),
based on Bamber Greenland DEM [-@bamber_2001_greenland_dem].

Reproject this data file to `EPSG:4326` using bilinear interpolation.


## Validation

A walkthrough of tackling this reprojection is provided in the [solution Jupyter
Notebook](/content/exercises/data-scenarios/raster-needs-reprojection/solutions/solution.ipynb).

The resulting solution data file should be bilinearly interpolated to EPSG:4326
and the range of elevation values across the ice sheet should closely resemble
those in the original data file. Be on the lookout for abnormal data values
along the edges of Greenland - it may mean you have not properly handled the
dataset's NoData value!
