---
title: "Data Scenario: Raster data needs reformatting"
categories: ["Data issue"]
listing:
  id: "file-listing"
  type: "table"
  sort-ui: false
  filter-ui: false
  contents:
    - "*"
    - "solutions/*"
---

::: {#file-listing}
:::

A colleague e-mails you aerial imagery that they extracted from the IceBridge DMS
dataset [@dominguez_2010_icebridge_dms] of a potential study site that you would like to
view in QGIS alongside some other data.

![datafile.jpg](/content/exercises/data-scenarios/raster-needs-reformatting/datafile.jpg
){width="65%" fig-align="center"}

The person who provided the data gives you the following details:

Corner coordinates for the data file are:

```text
Upper Left  ( -334334.200,-1855796.425) ( 55d12'45.62"W, 72d43'11.00"N)
Lower Left  ( -334334.200,-1860658.423) ( 55d11'11.56"W, 72d40'35.44"N)
Upper Right ( -327188.537,-1855796.425) ( 54d59'55.86"W, 72d43'51.77"N)
Lower Right ( -327188.537,-1860658.423) ( 54d58'23.69"W, 72d41'16.09"N)
```

The projection information is given as "Well Known Text" (WKT) in the provided
`datafile.prj` file.

Given this information, create a GeoTIFF file that can be loaded into QGIS and
viewed alongside other data in QGreenland.


## Validation

The GeoTIFF should include all of the metadata necessary to correctly position
it alongside other layers in QGreenland.

![Solution displayed along with QGreenland (`Internet-required data/Greenland
image mosaic` as base layer)](/_media/qgreenland_raster_reformatted2.png)


## Citation information

The provided `datafile.jpg` was extracted from [@dominguez_2010_icebridge_dms] imagery.
Specifically, the `DMS_1000211_02076_20100409_17225023.tif` file was subsetted and
converted to JPG for the purposes of this exercise.
