---
title: "Additional slides: GeoSpatial Data Formats"
subtitle: "See the [Geospatial data formats and metadata inspection](/content/slides/data-formats-and-inspection.html) slides for context!"
index: 31
background-image: "https://live.staticflickr.com/65535/50238782702_020e861875_k.jpg"
---

## Comma/Tab Separated Values ([CSV](https://www.loc.gov/preservation/digital/formats/fdd/fdd000323.shtml)/[TSV](https://www.loc.gov/preservation/digital/formats/fdd/fdd000533.shtml))

* General-purpose
    * Use case: vector data
* Highly interoperable
* Lacks metadata support

```{.csv filename="subset_towns_and_settlements.csv"}
name,old_greenlandic,designation,lon,lat
Ittaajimmiit,Igtâjimmiut,settlement,22.32133,70.459295
Nuuk,Nûk,town,51.737382,64.177058
Uunartoq,Ûnarteq,settlement,21.975401,70.414252
```

::: {.notes}
The advantage of CSV is that it's a "lowest common denominator" format that has broad
support. However, lack of metadata support is a deal-breaker for CSV as an interoperable
geospatial information format.

CSV can be fine for _some_ non-geospatial data. Without standardized support for
metadata (e.g. data types) you will sometimes find CSV authors "wing it" and write
metadata into CSV files in non-standard format, e.g. by adding lines to the end
of the file.  [W3 suggests](https://www.w3.org/TR/tabular-data-model/#embedded-metadata)
one method of embedding metadata into a CSV file, but it must be supported by the
processing software.
:::


## [ESRI Shapefile](https://www.loc.gov/preservation/digital/formats/fdd/fdd000280.shtml#factors) {.smaller}

* Vector data
* Lots of downsides:
    * Collection of multiple files
    * Field names limited to 10 characters
    * Limited to 255 fields
    * 2GB size limitation
    * More: <http://switchfromshapefile.org/#shapefileisbad>

```{.default code-line-numbers="false"}
unzip arctic_sea_routes.zip
```

```default
Archive:  arctic_sea_routes.zip
  inflating: Arctic_Sea_Routes.prj
  inflating: Arctic_Sea_Routes.shx
 extracting: Arctic_Sea_Routes.cpg
  inflating: Arctic_Sea_Routes.dbf
  inflating: Arctic_Sea_Routes.shp
```

::: {.notes}
ESRI shapefiles are actually a collection of files stored in a directory (or zip
file). E.g., `.shp`, `.prj`, etc.
:::
