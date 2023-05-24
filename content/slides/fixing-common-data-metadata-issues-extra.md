---
title: "Additional slides: Fixing common data/metadata issues)"
subtitle: "QGreenland Researcher Workshop 2023"
index: 61
background-image: "https://live.staticflickr.com/65535/50237921938_0e9dc8978a_k.jpg"
---

These slides are supplementary material we did not have time to cover in the [Geospatial
data formats and metadata inspection](/content/slides/data-formats-and-inspection.html)
slides!


## Data scenario: Raster needs reformatting

::::::::: {.r-fit-text}

[Link](/content/exercises/data-scenarios/raster-needs-reformatting)

:::::: {.columns}
:::{.column}
```{.default code-line-numbers="false"}
gdalinfo datafile.jpg
```

```{.default code-line-numbers="|9"}
Driver: JPEG/JPEG JFIF
Files: datafile.jpg
Size is 2813, 1914
Image Structure Metadata:
  COMPRESSION=JPEG
  INTERLEAVE=PIXEL
  SOURCE_COLOR_SPACE=YCbCr
Corner Coordinates:
Upper Left  (    0.0,    0.0)
Lower Left  (    0.0, 1914.0)
Upper Right ( 2813.0,    0.0)
Lower Right ( 2813.0, 1914.0)
Center      ( 1406.5,  957.0)
Band 1 Block=2813x1 Type=Byte, ColorInterp=Red
  Overviews: 1407x957, 704x479, 352x240
  Image Structure Metadata:
    COMPRESSION=JPEG
Band 2 Block=2813x1 Type=Byte, ColorInterp=Green
  Overviews: 1407x957, 704x479, 352x240
  Image Structure Metadata:
    COMPRESSION=JPEG
Band 3 Block=2813x1 Type=Byte, ColorInterp=Blue
  Overviews: 1407x957, 704x479, 352x240
  Image Structure Metadata:
    COMPRESSION=JPEG
```
:::

:::{.column}
```{.default code-line-numbers="false"}
gdalsrsinfo -o wkt_simple datafile.prj
```

```default
PROJCS["unnamed",
    GEOGCS["WGS 84",
        DATUM["WGS_1984",
            SPHEROID["WGS 84",6378137,298.257223563]],
        PRIMEM["Greenwich",0],
        UNIT["degree",0.0174532925199433]],
    PROJECTION["Polar_Stereographic"],
    PARAMETER["latitude_of_origin",70],
    PARAMETER["central_meridian",-45],
    PARAMETER["false_easting",0],
    PARAMETER["false_northing",0],
    UNIT["metre",1]]
```
![](/content/exercises/data-scenarios/raster-needs-reformatting/datafile.jpg){width="65%" fig-align="center"}
:::
::::::
:::::::::

:::{.notes}
Like our first scenario, `gdalinfo` shows no CRS information and the UL
corner coordinates is (0, 0). If we plotted this in QGIS, it would place the ULC
at the geographic north pole.
:::

## Raster needs reformatting: solution {.smaller}

Our colleague from the data scenario gave us the projection information as WKT in the
provided `.proj` file, so we can pass that file directly to `gdal_translate` with the
`-a_srs` option.

Our colleague also provided us with information about the location of the corner coordinates:

```default
Upper Left  ( -334334.200,-1855796.425) ( 55d12'45.62"W, 72d43'11.00"N)
Lower Left  ( -334334.200,-1860658.423) ( 55d11'11.56"W, 72d40'35.44"N)
Upper Right ( -327188.537,-1855796.425) ( 54d59'55.86"W, 72d43'51.77"N)
Lower Right ( -327188.537,-1860658.423) ( 54d58'23.69"W, 72d41'16.09"N)
```

The `-a_ullr` option takes an array of numbers: `ulx`, `uly`, `lrx`, `lry`

```{.default code-line-numbers="2|3"}
gdal_translate \
  -a_srs datafile.prj \
  -a_ullr -334334.200 -1855796.425 -327188.537 -1860658.423 \
  datafile.jpg datafile.tif
```


## Raster needs reformatting: All better!

```{.default code-line-numbers="false"}
gdalinfo datafile.tif
```
```{.default code-line-numbers="|4-40|42,48-49"}
Driver: GTiff/GeoTIFF
Files: datafile.tif
Size is 2813, 1914
Coordinate System is:
PROJCRS["unnamed",
    BASEGEOGCRS["WGS 84",
        DATUM["World Geodetic System 1984",
            ELLIPSOID["WGS 84",6378137,298.257223563,
                LENGTHUNIT["metre",1]]],
        PRIMEM["Greenwich",0,
            ANGLEUNIT["degree",0.0174532925199433]],
        ID["EPSG",4326]],
    CONVERSION["Polar Stereographic (variant B)",
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
        AXIS["(E)",south,
            MERIDIAN[90,
                ANGLEUNIT["degree",0.0174532925199433,
                    ID["EPSG",9122]]],
            ORDER[1],
            LENGTHUNIT["metre",1]],
        AXIS["(N)",south,
            MERIDIAN[180,
                ANGLEUNIT["degree",0.0174532925199433,
                    ID["EPSG",9122]]],
            ORDER[2],
            LENGTHUNIT["metre",1]]]
Data axis to CRS axis mapping: 1,2
Origin = (-334334.200000000011642,-1855796.425000000046566)
Pixel Size = (2.540228581585496,-2.540228840125342)
Metadata:
  AREA_OR_POINT=Area
Image Structure Metadata:
  INTERLEAVE=PIXEL
Corner Coordinates:
Upper Left  ( -334334.200,-1855796.425) ( 55d12'45.62"W, 72d43'11.00"N)
Lower Left  ( -334334.200,-1860658.423) ( 55d11'11.56"W, 72d40'35.44"N)
Upper Right ( -327188.537,-1855796.425) ( 54d59'55.86"W, 72d43'51.77"N)
Lower Right ( -327188.537,-1860658.423) ( 54d58'23.69"W, 72d41'16.09"N)
Center      ( -330761.368,-1858227.424) ( 55d 5'34.25"W, 72d42'13.68"N)
Band 1 Block=2813x1 Type=Byte, ColorInterp=Red
Band 2 Block=2813x1 Type=Byte, ColorInterp=Green
Band 3 Block=2813x1 Type=Byte, ColorInterp=Blue
```

:::{.notes}
`gdalinfo` shows that the output dataset has a CRS and the corner coordinate now
looks correct.
:::


## Raster needs reformatting: All better!

:::::: {.columns}
::: {.column}
![](/_media/qgreenland_raster_reformatted1.png)
:::

::: {.column}
![](/_media/qgreenland_raster_reformatted2.png){fig-align="center"}
:::
::::::

:::{.notes}
The image data is now correctly positioned, as shown in these screenshots from
QGreenland which has the "Reference/Borders/Greenland coastlines 2017" overlaid
and the "Internet-required data/Greenland image mosaic 2015 (15m)" as background
imagery. Lat/lon lines are shown for reference.
:::
