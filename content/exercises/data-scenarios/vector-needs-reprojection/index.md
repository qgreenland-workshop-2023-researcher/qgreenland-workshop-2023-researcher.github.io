---
title: "Data Scenario: Vector data needs reprojection"
categories: ["Data transformation"]
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


A colleague has sent you a CSV file containing the locations of potential field
study sites in Greenland. The CSV provides coordinates in latitude and longitude
(EPSG:4326 / WGS84) but your site suitability analysis code expects coordinates
in NSIDC Polar Stereographic North (EPSG:3413). Furthermore, your code expects
that the potential sites be provided as a GeoPackage (`.gpkg`) file.

Reproject `datafile.csv` from `EPSG:4326` to `EPSG:3413` and convert the format
to GeoPackage.


# Validation

The resulting solution file should be in `EPSG:3413`. Use `ogrinfo` to confirm
this!

E.g.,

```bash
$ ogrinfo -al -so datafile_3413.gpkg
INFO: Open of `datafile_3413.gpkg'
      using driver `GPKG' successful.

Layer name: datafile
Geometry: Point
Feature Count: 4
Extent: (-164571.813077, -3062830.102061) - (632164.491184, -983579.321457)
Layer SRS WKT:
PROJCRS["WGS 84 / NSIDC Sea Ice Polar Stereographic North",
    BASEGEOGCRS["WGS 84",
        ENSEMBLE["World Geodetic System 1984 ensemble",
            MEMBER["World Geodetic System 1984 (Transit)"],
            MEMBER["World Geodetic System 1984 (G730)"],
            MEMBER["World Geodetic System 1984 (G873)"],
            MEMBER["World Geodetic System 1984 (G1150)"],
            MEMBER["World Geodetic System 1984 (G1674)"],
            MEMBER["World Geodetic System 1984 (G1762)"],
            MEMBER["World Geodetic System 1984 (G2139)"],
            ELLIPSOID["WGS 84",6378137,298.257223563,
                LENGTHUNIT["metre",1]],
            ENSEMBLEACCURACY[2.0]],
        PRIMEM["Greenwich",0,
            ANGLEUNIT["degree",0.0174532925199433]],
        ID["EPSG",4326]],
    CONVERSION["US NSIDC Sea Ice polar stereographic north",
        METHOD["Polar Stereographic (variant B)",
            ID["EPSG",9829]],
        PARAMETER["Latitude of standard parallel",70,
            ANGLEUNIT["degree",0.0174532925199433],
            ID["EPSG",8832]],
        PARAMETER["Longitude of origin",-45,
            ANGLEUNIT["degree",0.0174532925199433],
            ID["EPSG",8833]],
        PARAMETER["False easting",0,
            LENGTHUNIT["metre",1],
            ID["EPSG",8806]],
        PARAMETER["False northing",0,
            LENGTHUNIT["metre",1],
            ID["EPSG",8807]]],
    CS[Cartesian,2],
        AXIS["easting (X)",south,
            MERIDIAN[45,
                ANGLEUNIT["degree",0.0174532925199433]],
            ORDER[1],
            LENGTHUNIT["metre",1]],
        AXIS["northing (Y)",south,
            MERIDIAN[135,
                ANGLEUNIT["degree",0.0174532925199433]],
            ORDER[2],
            LENGTHUNIT["metre",1]],
    USAGE[
        SCOPE["Polar research."],
        AREA["Northern hemisphere - north of 60°N onshore and offshore, including Arctic."],
        BBOX[60,-180,90,180]],
    ID["EPSG",3413]]
Data axis to CRS axis mapping: 1,2
FID Column = fid
Geometry Column = geom
id: String (0.0)
longitude: Real (0.0)
latitude: Real (0.0)
description: String (0.0)
```
