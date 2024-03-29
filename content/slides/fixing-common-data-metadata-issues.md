---
title: "Fixing common data/metadata issues"
subtitle: "QGreenland Researcher Workshop 2023"
index: 60
background-image: "https://live.staticflickr.com/65535/50237921938_0e9dc8978a_k.jpg"
---

## Common data/metadata issues?

It's common for data to be missing metadata. We often see:

* CRS information missing
* Flag values (e.g. `NoData`) not set
* In a format without metadata support

It's also not uncommon for data or metadata to be incorrect or in conflict with the
dataset's user guide. Fixing these issues requires thought and judgment calls.


## What tool should I use?

The best one for the job. Explore the alternatives available in the ecosystem you want
to work!

* GUI-based GIS tools (QGIS!) are useful for visualization of data, especially
  in
  comparison with other layers like a basemap.
* Command-line tools are especially useful for getting a quick answer. 
* Language-specific (e.g., Python) tools are good for automations or research
  code.

::: {.notes}
You may recognize this slide from the "data inspection" deck.

These examples use Python because that is what we are most familiar with, but explore
your preferred ecosystem and you will find equivalents.
:::


## GDAL/OGR drivers

* [Vector drivers](https://gdal.org/drivers/vector/index.html)
* [Raster drivers](https://gdal.org/drivers/raster/index.html)


It's worth looking at the list of drivers for your datatype and reading the
documentation. We'll revisit this in a later slide.


## Data scenario: Raster missing geospatial metadata

[View the full scenario](/content/exercises/data-scenarios/raster-missing-geospatial-metadata)

:::::: {.columns}
::: {.column}
![QGreenland screenshot of layer with missing
metadata](/_media/qgreenland_missing_metadata.png)
:::

::: {.column}
```{.default code-line-numbers="false"}
gdalinfo dem_without_metadata.tif
```

```{.default code-line-numbers="10"}
Driver: GTiff/GeoTIFF
Files: dem_without_metadata.tif
Size is 301, 561
Metadata:
  TIFFTAG_XRESOLUTION=1
  TIFFTAG_YRESOLUTION=1
Image Structure Metadata:
  INTERLEAVE=BAND
Corner Coordinates:
Upper Left  (    0.0,    0.0)
Lower Left  (    0.0,  561.0)
Upper Right (  301.0,    0.0)
Lower Right (  301.0,  561.0)
Center      (  150.5,  280.5)
Band 1 Block=301x6 Type=Float32, ColorInterp=Gray
```
:::
::::::

::: {.notes}
This is a real scenario we've encountered before, but not with this exact dataset.

*Presenter: Open the data scenario link. Read through the prompt up to "Validation"*.

The included data file sample (`dem_without_metadata.tif`) is not a real example
of data from NSIDC; it's been modified from the original
[@bamber_2001_greenland_dem] to present a challenge.
:::


## Raster missing geospatial metadata: Solution

Use [gdal_translate](https://gdal.org/programs/gdal_translate.html) to edit the
metadata with the information provided to us in the mock dataset landing page.

```{.default code-line-numbers="false" code-overflow="scroll"}
gdal_translate \
  -a_srs "+proj=stere +lat_0=90 +lat_ts=71 +lon_0=-39 +x_0=0 +y_0=0 +a=6378137 +rf=298.257024882273 +units=m +no_defs" \
  -a_ullr -802500.000 -597500.000 702500.000 -3402500.000 \
  dem_without_metadata.tif dem_with_metadata.tif
```

::: {.notes}
`gdal_translate` or `gdal_edit.py` are both well-suited for this task. `gdal_translate`
can change the file format, but doesn't need to here. The data is already a `.tif`,
which supports metadata required by tools like `qgis` to correctly locate the data in
space.
:::


## Raster missing geospatial metadata: All better!

```{.default code-line-numbers="false"}
gdalinfo dem_with_metadata.tif
```

```{.default code-line-numbers="|4-41|43,51-52|44"}
Driver: GTiff/GeoTIFF
Files: dem_with_metadata.tif
Size is 301, 561
Coordinate System is:
PROJCRS["unknown",
    BASEGEOGCRS["unknown",
        DATUM["unknown",
            ELLIPSOID["unknown",6378137,298.257024882273,
                LENGTHUNIT["metre",1,
                    ID["EPSG",9001]]]],
        PRIMEM["Greenwich",0,
            ANGLEUNIT["degree",0.0174532925199433,
                ID["EPSG",9122]]]],
    CONVERSION["Polar Stereographic (variant B)",
        METHOD["Polar Stereographic (variant B)",
            ID["EPSG",9829]],
        PARAMETER["Latitude of standard parallel",71,
            ANGLEUNIT["degree",0.0174532925199433],
            ID["EPSG",8832]],
        PARAMETER["Longitude of origin",-39,
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
Origin = (-802500.000000000000000,-597500.000000000000000)
Pixel Size = (5000.000000000000000,-5000.000000000000000)
Metadata:
  AREA_OR_POINT=Area
  TIFFTAG_XRESOLUTION=1
  TIFFTAG_YRESOLUTION=1
Image Structure Metadata:
  INTERLEAVE=BAND
Corner Coordinates:
Upper Left  ( -802500.000, -597500.000) ( 92d19'49.93"W, 80d48'38.29"N)
Lower Left  ( -802500.000,-3402500.000) ( 52d16'15.67"W, 58d36'12.78"N)
Upper Right (  702500.000, -597500.000) ( 10d37' 3.76"E, 81d31'36.98"N)
Lower Right (  702500.000,-3402500.000) ( 27d20' 3.47"W, 58d47'17.98"N)
Center      (  -50000.000,-2000000.000) ( 40d25'55.55"W, 71d44'12.84"N)
Band 1 Block=301x6 Type=Float32, ColorInterp=Gray
```

:::{.notes}
The output of our `gdal_translate` operation has the metadata we expect: a CRS is
present, an origin is established (the upper-left-hand-corner), and the pixel size is
5000 meters (5 km).

It's OK that the `WKT` contains `"unknown"` several times. We defined the ellipsoid and
other parameters manually on the previous slide, and because this doesn't exactly match
a named projection (for example, in the EPSG database), we see `"unknown"`.
:::


## Raster missing geospatial metadata: All better!

![QGreenland screenshot of layer with fixed 
metadata](/_media/qgreenland_edited_metadata.png)


## Data scenario: Vector data needs reformatting

[View the full scenario](/content/exercises/data-scenarios/vector-needs-reformatting)

:::::: {.columns}
::: {.column}
![xlsx vector data](/_media/qgreenland_scenario1_table.png)
:::

::: {.column}
```{.default code-line-numbers="false"}
ogrinfo -al -so \
  kcbcc_DS4_final_v2_final.xlsx
```

```{.default code-line-numbers="|4|5,9-10|7-8"}
INFO: Open of `kcbcc_DS4_final_v2_final.xlsx'
      using driver `XLSX' successful.

Layer name: Sheet1
Geometry: None
Feature Count: 12
Layer SRS WKT:
(unknown)
x: Real (0.0)
y: Real (0.0)
cuteness_rating: Real (0.0)
blood_acetone_grams_per_ml: Real (0.0)
blood_acetylcholine_grams_per_ml: Real (0.0)
```
:::
::::::

:::{.notes}
The x and y values appear to be lat and lon values. Our email from Dr. Foobarbaz
indicates the data is in a "WGS84" projection.

Note `Geometry: None` -- `gdal` can't find Geometry in the spreadsheet.

Note `Layer SRS WKT` is unknown. There is no geospatial metadata to describe the CRS in
an Excel file.

`ogrinfo`:

* `-al`: list all features of all layers (we don't have to pass in `Sheet1`
  to get information about what fields it contains).
* `-so`: Summary Only
:::

## Vector data needs reformatting: Solution

:::::: {.r-fit-text}
The `gdal` [VRT](https://gdal.org/drivers/vector/vrt.html) driver can be used.

Add a `kcbcc_DS4_final_v2_final.vrt` with the following content:

```xml
<OGRVRTDataSource>
    <OGRVRTLayer name="Sheet1">
        <SrcDataSource>kcbcc_DS4_final_v2_final.xlsx</SrcDataSource>
        <SrcLayer>Sheet1</SrcLayer>
        <GeometryType>wkbPoint</GeometryType>
        <LayerSRS>EPSG:4326</LayerSRS>
        <GeometryField encoding="PointFromColumns" x="x" y="y" reportSrcColumn="FALSE" />
    </OGRVRTLayer>
</OGRVRTDataSource>
```

Then, use `ogr2ogr`:

```{.default code-line-numbers="false"}
ogr2ogr \
  -nln "kcbcc" \
  output.geojson \
  kcbcc_DS4_final_v2_final.vrt
```
::::::

:::{.notes}
We chose to use the OGR VRT driver after reading the docs for the [XLSX
driver](https://gdal.org/drivers/vector/xlsx.html#vector-xlsx) and seeing "No geometry
support is available directly (but you may use the OGR VRT capabilities for that)".

A `.vrt` file that sits alongside the xlsx file containing the above will allow
ogr2ogr to transform the data into a GeoPackage, GeoJSON, etc. Note that the VRT file
has the same file name as the data, enabling our tool to auto-detect it.

Note the `EPSG` code, the name of the sheet containing the data, and the data file name
are encoded in the VRT. Also note the `<GeometryField>` tag contains the column names of
the X and Y fields.

The `-nln` flag in the `ogr2ogr` command sets the new layer name.

For `ogr2ogr`, the output file comes before the input file, which is unusual.

Note that there are other approaches that use `ogr2ogr` as well. E.g., the
[`with_ogr2ogr.sh`
solution](/content/exercises/data-scenarios/vector-needs-reformatting/solution/with_ogr2ogr.sh)
uses an SQL query to generate GeoJSON with the correct metadata.
:::

## Vector data needs reformatting: All better!

```{.default code-line-numbers="false"}
cat output.geojson | jq
```

```json
{
  "type": "FeatureCollection",
  "name": "kcbcc",
  "crs": {
    "type": "name",
    "properties": {
      "name": "urn:ogc:def:crs:OGC:1.3:CRS84"
    }
  },
  "features": [
    {
      "type": "Feature",
      "properties": {
        "cuteness_rating": 9.226,
        "blood_acetone_grams_per_ml": 1.945e-05,
        "blood_acetylcholine_grams_per_ml": 7.22e-08
      },
      "geometry": {
        "type": "Point",
        "coordinates": [
          -63.3070952173288,
          76.9630048613197
        ]
      }
    },
    ...<clipped for brevity>...
  ]
}
```

:::{.notes}
We could have output this reformatted data as a GeoPackage like we do for other vector
layers in QGreenland but GeoJSON is human readable, and the output as formatted by `jq`
shows that the required CRS information is now present and that point geometries have
been created from the records in the original XLSX file.
:::


## Vector data needs reformatting: All better!

```{.default code-line-numbers="false"}
ogrinfo -al -so output.geojson
```

```{.default code-line-numbers="|4|5-7|8-22"}
INFO: Open of `output.geojson'
      using driver `GeoJSON' successful.

Layer name: kcbcc
Geometry: Point
Feature Count: 12
Extent: (-63.307095, 64.081793) - (-22.181734, 76.963005)
Layer SRS WKT:
GEOGCRS["WGS 84",
    DATUM["World Geodetic System 1984",
        ELLIPSOID["WGS 84",6378137,298.257223563,
            LENGTHUNIT["metre",1]]],
    PRIMEM["Greenwich",0,
        ANGLEUNIT["degree",0.0174532925199433]],
    CS[ellipsoidal,2],
        AXIS["geodetic latitude (Lat)",north,
            ORDER[1],
            ANGLEUNIT["degree",0.0174532925199433]],
        AXIS["geodetic longitude (Lon)",east,
            ORDER[2],
            ANGLEUNIT["degree",0.0174532925199433]],
    ID["EPSG",4326]]
Data axis to CRS axis mapping: 2,1
cuteness_rating: Real (0.0)
blood_acetone_grams_per_ml: Real (0.0)
blood_acetylcholine_grams_per_ml: Real (0.0)
```

:::{.notes}
`ogrinfo` confirms the metadata visible in the structure of the GeoJSON in the previous
slide is understandable to GDAL.

The layer has the name we provided `ogr2ogr`, has 12 point features, and a
defined CRS (EPSG:4326, WGS84)
:::


## Vector data needs reformatting: All better!

![QGreenland screenshot of reformatted vector
layer](/_media/qgreenland_reformatted_vector_map.png)


## What if I can not find a way to fix my data?

Metadata may be undocumented or incorrectly documented; contact data producer!

::: {.callout-warning}
It's possible nobody living knows how to fix the problem!
:::

See [continued learning](/content/continued_learning.md) to learn more about
how georegistration could help.

::: {.notes}
Worst-case scenarios:

* If the metadata is incorrectly documented, there may be no way to "guess" the correct
  configuration. Contacting the originator may be the _only_ way forward.
* Data originator may have passed away, changed careers, stopped checking their
  email, or forgotten about the data you are working with.

If there are recognizable spatial features in the data, you may be able to georeference
it. See "continued learning" section to learn more about this.
:::


## Exercise

💪 [Fixing an issue with data/metadata](/content/exercises/fix-data-metadata-issues.html)


## References
