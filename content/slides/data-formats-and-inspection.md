---
title: "Data/metadata inspection"
subtitle: "QGreenland Researcher Workshop 2023"
index: 30
background-image: "/_media/DMS_1842643_12758_20180418_18111267_clipped.jpg"
title-slide-attributes:
  data-background-image: "/_media/DMS_1842643_12758_20180418_18111267_clipped.jpg"
---

# Geospatial data formats

In general, we suggest formats that:

* Are non-proprietary
* Are broadly supported by common software tools
* Have rich metadata support

::: {.notes}
There are various data file formats for storing geospatial data and the
selection of a format depends on use case and data type.

The best formats for storing geospatial data have been designed for this purpose.
Some general-purpose formats like CSV may be okay, but not great.
:::


## Finding information about formats

* [Library of Congress list of digital
formats](https://www.loc.gov/preservation/digital/formats/fdd/browse_list.shtml)
    * Check the "Licensing and patents" section to learn about openness of a format.

* [Open Geospatial Consortium (OGC)-adopted standards](https://www.ogc.org/standards/)
    * In these slides, 🌎 indicates an OGC-adopted standard.

::: {.notes}
From the [OGC website](https://www.ogc.org): "We represent over 500 businesses,
government agencies, research organizations, and universities united with a desire to
make location information FAIR – Findable, Accessible, Interoperable, and Reusable."
Among those organizations represented are USGS, NOAA, ESA, AWS, and Esri.
:::


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


## Microsoft [.xls](https://www.loc.gov/preservation/digital/formats/fdd/fdd000510.shtml)/[.xlsx](https://www.loc.gov/preservation/digital/formats/fdd/fdd000401.shtml)

:::: {.columns}
::: {.column}
* General-purpose
    * Use case: vector data
* Lacks metadata support
* No support for data types
* Proprietary (.xls)
:::

::: {.column}
![Microsoft Excel 2010 © Microsoft Corporation](/_media/Excel_2010.png)
:::
::::

::: {.notes}
No support for data types: "[The display of stored numbers as integers or currency is
through display format options.](https://www.loc.gov/preservation/digital/formats/fdd/fdd000398.shtml)"

XLSX is an ["open"](https://en.wikipedia.org/wiki/Office_Open_XML#Licensing) extension
of XML.
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


## [GeoJSON](https://www.loc.gov/preservation/digital/formats/fdd/fdd000382.shtml) 🌎 {.smaller}

* Vector data
* An extension of the JSON standard supporting geospatial metadata
* Text-based, can be read by humans
* Supports any CRS; defaults to `urn:ogc:def:crs:OGC::CRS84`
    * Same as `EPSG:4326` but reverse coordinate order `lon, lat`

```{.json filename="greenland-border.geojson" style="height: 300px;"}
{
  "type":"FeatureCollection",
  "features":[
    {
      "type":"Feature",
      "id":"GRL",
      "properties":{"name":"Greenland"},
      "geometry":{
        "type":"Polygon",
        "coordinates":[[
          [-46.76379,82.62796],
          [-43.40644,83.22516],
          [-39.89753,83.18018],
          [-38.62214,83.54905],
          [-35.08787,83.64513],
          [-27.10046,83.51966],
          [-20.84539,82.72669],
          [-22.69182,82.34165],
          [-26.51753,82.29765],
          [-31.9,82.2],
          [-31.39646,82.02154],
          [-27.85666,82.13178],
          [-24.84448,81.78697],
          [-22.90328,82.09317],
          [-22.07175,81.73449],
          [-23.16961,81.15271],
          [-20.62363,81.52462],
          [-15.76818,81.91245],
          [-12.77018,81.71885],
          [-12.20855,81.29154],
          [-16.28533,80.58004],
          [-16.85,80.35],
          [-20.04624,80.17708],
          [-17.73035,80.12912],
          [-18.9,79.4],
          [-19.70499,78.75128],
          [-19.67353,77.63859],
          [-18.47285,76.98565],
          [-20.03503,76.94434],
          [-21.67944,76.62795],
          [-19.83407,76.09808],
          [-19.59896,75.24838],
          [-20.66818,75.15585],
          [-19.37281,74.29561],
          [-21.59422,74.22382],
          [-20.43454,73.81713],
          [-20.76234,73.46436],
          [-22.17221,73.30955],
          [-23.56593,73.30663],
          [-22.31311,72.62928],
          [-22.29954,72.18409],
          [-24.27834,72.59788],
          [-24.79296,72.3302],
          [-23.44296,72.08016],
          [-22.13281,71.46898],
          [-21.75356,70.66369],
          [-23.53603,70.471],
          [-24.30702,70.85649],
          [-25.54341,71.43094],
          [-25.20135,70.75226],
          [-26.36276,70.22646],
          [-23.72742,70.18401],
          [-22.34902,70.12946],
          [-25.02927,69.2588],
          [-27.74737,68.47046],
          [-30.67371,68.12503],
          [-31.77665,68.12078],
          [-32.81105,67.73547],
          [-34.20196,66.67974],
          [-36.35284,65.9789],
          [-37.04378,65.93768],
          [-38.37505,65.69213],
          [-39.81222,65.45848],
          [-40.66899,64.83997],
          [-40.68281,64.13902],
          [-41.1887,63.48246],
          [-42.81938,62.68233],
          [-42.41666,61.90093],
          [-42.86619,61.07404],
          [-43.3784,60.09772],
          [-44.7875,60.03676],
          [-46.26364,60.85328],
          [-48.26294,60.85843],
          [-49.23308,61.40681],
          [-49.90039,62.38336],
          [-51.63325,63.62691],
          [-52.14014,64.27842],
          [-52.27659,65.1767],
          [-53.66166,66.09957],
          [-53.30161,66.8365],
          [-53.96911,67.18899],
          [-52.9804,68.35759],
          [-51.47536,68.72958],
          [-51.08041,69.14781],
          [-50.87122,69.9291],
          [-52.013585,69.574925],
          [-52.55792,69.42616],
          [-53.45629,69.283625],
          [-54.68336,69.61003],
          [-54.75001,70.28932],
          [-54.35884,70.821315],
          [-53.431315,70.835755],
          [-51.39014,70.56978],
          [-53.10937,71.20485],
          [-54.00422,71.54719],
          [-55,71.406537],
          [-55.83468,71.65444],
          [-54.71819,72.58625],
          [-55.32634,72.95861],
          [-56.12003,73.64977],
          [-57.32363,74.71026],
          [-58.59679,75.09861],
          [-58.58516,75.51727],
          [-61.26861,76.10238],
          [-63.39165,76.1752],
          [-66.06427,76.13486],
          [-68.50438,76.06141],
          [-69.66485,76.37975],
          [-71.40257,77.00857],
          [-68.77671,77.32312],
          [-66.76397,77.37595],
          [-71.04293,77.63595],
          [-73.297,78.04419],
          [-73.15938,78.43271],
          [-69.37345,78.91388],
          [-65.7107,79.39436],
          [-65.3239,79.75814],
          [-68.02298,80.11721],
          [-67.15129,80.51582],
          [-63.68925,81.21396],
          [-62.23444,81.3211],
          [-62.65116,81.77042],
          [-60.28249,82.03363],
          [-57.20744,82.19074],
          [-54.13442,82.19962],
          [-53.04328,81.88833],
          [-50.39061,82.43883],
          [-48.00386,82.06481],
          [-46.59984,81.985945],
          [-44.523,81.6607],
          [-46.9007,82.19979],
          [-46.76379,82.62796],
        ]],
      },
    },
  ],
}
```


## [GeoTIFF](https://www.loc.gov/preservation/digital/formats/fdd/fdd000279.shtml) 🌎

* Raster data
* An extension of the TIFF standard supporting geospatial metadata
* Works with almost all image viewer software


## [NetCDF](https://www.unidata.ucar.edu/software/netcdf/) 🌎

* Raster (and vector) data
* Extension of [HDF5](https://www.loc.gov/preservation/digital/formats/fdd/fdd000229.shtml) 🌎
* Self-Describing
* Efficient storage of multi-dimensional arrays of data (e.g., `time`,
  `elevation`, `longitude`, `latitude` as dimensions of a `temperature`
  variable)

::: {.notes}
Most commonly used to store raster datasets, often with additional dimensions
(e.g., `time`, `scenario`, etc), however, [NetCDFs can store vector
data](https://gdal.org/drivers/vector/netcdf.html)
:::


## [GeoPackage](https://www.loc.gov/preservation/digital/formats/fdd/fdd000520.shtml) 🌎

* Raster, vector, and more...
* A specialized SQLite database supporting geospatial metadata
* Can store datasets of different types in a single file


<!-- TODO: Slide on `gdalsrsinfo`? -->


# Inspecting Data

## What tool should I use?

The best one for the job.

Explore the alternatives available in the ecosystem you want to work!

::: {.notes}
Tool selection is context-dependent.

Command-line tools are especially useful for getting a quick answer.

Language-specific tools are good for automations or research code. These
examples use Python because that's what we're most familiar with, but explore
your preferred ecosystem and you'll find equivalents.
:::


## Learning more about CLI tool (`--help`)

The first thing to try is `<command> --help`:

```{.default code-line-numbers="false"}
gdalinfo --help
```

```default
Usage: gdalinfo [--help-general] [-json] [-mm] [-stats] [-hist] [-nogcp] [-nomd]
                [-norat] [-noct] [-nofl] [-checksum] [-proj4]
                [-listmdd] [-mdd domain|`all`] [-wkt_format WKT1|WKT2|...]*
                [-sd subdataset] [-oo NAME=VALUE]* datasetname
```


## Learning more about CLI tool (`man`)

If the `--help` output isn't useful, try the "manual pages" with the `man` command.

```{.default code-line-numbers="false"}
man gdalinfo
```

```{.man style="height: 300px;"}
gdalinfo(1)            General Commands Manual            gdalinfo(1)

NAME
       gdalinfoLists information about a raster dataset.

SYNOPSIS
       gdalinfo [--help-general] [-json] [-mm] [-stats] [-hist] [-nogcp] [-nomd]
                [-norat] [-noct] [-nofl] [-checksum] [-proj4]
                [-listmdd] [-mdd domain|`all`]* [-wkt_format WKT1|WKT2|...]
                [-sd subdataset] [-oo NAME=VALUE]* datasetname

DESCRIPTION
       The gdalinfo program lists various information about a GDAL
       supported raster dataset.

       -json
           Display the output in json format.

       -mm
           Force computation of the actual min/max values for each
           band in the dataset.

       -stats
           Read and display image statistics. Force computation if no
           statistics are stored in an image.

       -approx_stats
           Read and display image statistics. Force computation if no
           statistics are stored in an image. However, they may be
           computed based on overviews or a subset of all tiles.
           Useful if you are in a hurry and don't want precise stats.

       -hist
           Report histogram information for all bands.

       -nogcp
           Suppress ground control points list printing. It may be
           useful for datasets with huge amount of GCPs, such as L1B
           AVHRR or HDF4 MODIS which contain thousands of them.

       -nomd
           Suppress metadata printing. Some datasets may contain a
           lot of metadata strings.

       -norat
           Suppress printing of raster attribute table.

       -noct
           Suppress printing of color table.

       -checksum
           Force computation of the checksum for each band in the
           dataset.

       -listmdd
           (GDAL >= 1.11) List all metadata domains available for the
           dataset.

       -mdd domain
           Report metadata for the specified domain. Starting with
           GDAL 1.11, 'all' can be used to report metadata in all
           domains

       -nofl
           (GDAL >= 1.9.0) Only display the first file of the file
           list.

       -wkt_format WKT1/WKT2/...
           (GDAL >= 3.0.0) WKT format used to display the SRS.
           Currently supported values are: WKT1, WKT2 (latest WKT
           version, currently WKT2_2018), WKT2_2015, WKT2_2018

       -sd subdataset
           (GDAL >= 1.9.0) If the input dataset contains several
           subdatasets read and display a subdataset with specified
           number (starting from 1). This is an alternative of giving
           the full subdataset name.

       -proj4
           (GDAL >= 1.9.0) Report a PROJ.4 string corresponding to
           the file's coordinate system.

       -oo NAME=VALUE:
           (starting with GDAL 2.0) Dataset open option (format
           specific)

       The gdalinfo will report all of the following (if known):

       • The format driver used to access the file.
       • Raster size (in pixels and lines).
       • The coordinate system for the file (in OGC WKT).
       • The geotransform associated with the file (rotational
         coefficients are currently not reported).
       • Corner coordinates in georeferenced, and if possible
         lat/long based on the full geotransform (but not GCPs).
       • Ground control points.
       • File wide (including subdatasets) metadata.
       • Band data types.
       • Band color interpretations.
       • Band block size.
       • Band descriptions.
       • Band min/max values (internally known and possibly
         computed).
       • Band checksum (if computation asked).
       • Band NODATA value.
       • Band overview resolutions available.
       • Band unit type (i.e.. 'meters' or 'feet' for elevation
         bands).
       • Band pseudo-color tables.
C API
       Starting with GDAL 2.1, this utility is also callable from C
       with GDALInfo().
EXAMPLE
       gdalinfo ~/openev/utm.tif
       Driver: GTiff/GeoTIFF
       Size is 512, 512
       Coordinate System is:
       PROJCS["NAD27 / UTM zone 11N",
           GEOGCS["NAD27",
               DATUM["North_American_Datum_1927",
                   SPHEROID["Clarke 1866",6378206.4,294.978698213901]],
               PRIMEM["Greenwich",0],
               UNIT["degree",0.0174532925199433]],
           PROJECTION["Transverse_Mercator"],
           PARAMETER["latitude_of_origin",0],
           PARAMETER["central_meridian",-117],
           PARAMETER["scale_factor",0.9996],
           PARAMETER["false_easting",500000],
           PARAMETER["false_northing",0],
           UNIT["metre",1]]
       Origin = (440720.000000,3751320.000000)
       Pixel Size = (60.000000,-60.000000)
       Corner Coordinates:
       Upper Left  (  440720.000, 3751320.000) (117d38'28.21"W, 33d54'8.47"N)
       Lower Left  (  440720.000, 3720600.000) (117d38'20.79"W, 33d37'31.04"N)
       Upper Right (  471440.000, 3751320.000) (117d18'32.07"W, 33d54'13.08"N)
       Lower Right (  471440.000, 3720600.000) (117d18'28.50"W, 33d37'35.61"N)
       Center      (  456080.000, 3735960.000) (117d28'27.39"W, 33d45'52.46"N)
       Band 1 Block=512x16 Type=Byte, ColorInterp=Gray
AUTHORS
       Frank Warmerdam warmerdam@pobox.com, Silke Reimer
       silke@intevation.de

GDAL                       Sun Mar 29 2020                gdalinfo(1)
```


## Learning more about Python tool

The built-in [`help()`](https://docs.python.org/3/library/functions.html#help) function
provides a help page on the given object.

```{.python style="height: 300px"}
>>> import rasterio
>>> help(rasterio)
Help on package rasterio:

NAME
    rasterio - Rasterio

PACKAGE CONTENTS
    _base
    _env
    _err
    _example
    _features
    _filepath
    _fill
    _io
    _path
    _show_versions
    _transform
    _version
    _warp
    control
    coords
    crs
    drivers
    dtypes
    enums
    env
    errors
    features
    fill
    io
    mask
    merge
    path
    plot
    profiles
    rio (package)
    rpc
    sample
    session
    shutil
    tools
    transform
    vrt
    warp
    windows

CLASSES
    builtins.object
        rasterio.crs.CRS
        rasterio.env.Env
    
    class CRS(builtins.object)
     |  CRS(initialdata=None, **kwargs)
     |  A geographic or projected coordinate reference system.
     |  
     |      CRS objects may be created by passing PROJ parameters as keyword
     |      arguments to the standard constructor or by passing EPSG codes, PROJ
     |      mappings, PROJ strings, or WKT strings to the from_epsg, from_dict,
     |      from_string, or from_wkt static methods.
     |  
     |      Examples
     |      --------
     |  
     |      The from_dict method takes PROJ parameters as keyword arguments.
     |  
     |      >>> crs = CRS.from_dict(proj="aea")
     |  
     |      EPSG codes may be used with the from_epsg method.
     |  
     |      >>> crs = CRS.from_epsg(3005)
     |  
     |      The from_string method takes a variety of input.
     |  
     |      >>> crs = CRS.from_string("EPSG:3005")
     |  
     |  Methods defined here:
     |  
     |  __bool__(self, /)
     |      True if self else False
     |  
     |  __copy__(...)
     |      CRS.__copy__(self)
     |  
     |  __eq__(self, value, /)
     |      Return self==value.
     |  
     |  __ge__(self, value, /)
     |      Return self>=value.
     |  
     |  __getitem__(self, key, /)
     |      Return self[key].
     |  
     |  __getstate__(...)
     |      CRS.__getstate__(self)
     |  
     |  __gt__(self, value, /)
     |      Return self>value.
     |  
     |  __hash__(self, /)
     |      Return hash(self).
     |  
     |  __init__(...)
     |      Make a CRS from a PROJ dict or mapping.
     |      
     |      Parameters
     |      ----------
     |      initialdata : mapping, optional
     |          A dictionary or other mapping
     |      kwargs : mapping, optional
     |          Another mapping. Will be overlaid on the initialdata.
     |      
     |      Returns
     |      -------
     |      CRS
     |  
     |  __iter__(self, /)
     |      Implement iter(self).
     |  
     |  __le__(self, value, /)
     |      Return self<=value.
     |  
     |  __len__(self, /)
     |      Return len(self).
     |  
     |  __lt__(self, value, /)
     |      Return self<value.
     |  
     |  __ne__(self, value, /)
     |      Return self!=value.
     |  
     |  __nonzero__ = __bool__(self, /)
     |  
     |  __reduce_cython__(...)
     |      CRS.__reduce_cython__(self)
     |  
     |  __repr__(self, /)
     |      Return repr(self).
     |  
     |  __setstate__(...)
     |      CRS.__setstate__(self, state)
     |  
     |  __setstate_cython__(...)
     |      CRS.__setstate_cython__(self, __pyx_state)
     |  
     |  __str__(self, /)
     |      Return str(self).
     |  
     |  get(...)
     |      CRS.get(self, item)
     |  
     |  items(...)
     |      CRS.items(self)
     |  
     |  to_authority(...)
     |      CRS.to_authority(self, confidence_threshold=70)
     |      Convert to the best match authority name and code.
     |      
     |              For a CRS created using an EPSG code, that same value is
     |              returned.  For other CRS, including custom CRS, an attempt is
     |              made to match it to definitions in authority files.  Matches
     |              with a confidence below the threshold are discarded.
     |      
     |              Parameters
     |              ----------
     |              confidence_threshold : int
     |                  Percent match confidence threshold (0-100).
     |      
     |              Returns
     |              -------
     |              name : str
     |                  Authority name.
     |              code : str
     |                  Code from the authority file.
     |      
     |              or None
     |  
     |  to_dict(...)
     |      CRS.to_dict(self, projjson=False)
     |      Convert CRS to a PROJ dict.
     |      
     |              .. note:: If there is a corresponding EPSG code, it will be used
     |                 when returning PROJ parameter dict.
     |      
     |              .. versionadded:: 1.3.0
     |      
     |              Parameters
     |              ----------
     |              projjson: bool, default=False
     |                  If True, will convert to PROJ JSON dict (Requites GDAL 3.1+
     |                  and PROJ 6.2+).  If False, will convert to PROJ parameter
     |                  dict.
     |      
     |              Returns
     |              -------
     |              dict
     |  
     |  to_epsg(...)
     |      CRS.to_epsg(self, confidence_threshold=70)
     |      Convert to the best match EPSG code.
     |      
     |              For a CRS created using an EPSG code, that same value is
     |              returned.  For other CRS, including custom CRS, an attempt is
     |              made to match it to definitions in the EPSG authority file.
     |              Matches with a confidence below the threshold are discarded.
     |      
     |              Parameters
     |              ----------
     |              confidence_threshold : int
     |                  Percent match confidence threshold (0-100).
     |                 
     |              Returns
     |              -------
     |              int or None
     |      
     |              Raises
     |              ------
     |              CRSError
     |  
     |  to_proj4(...)
     |      CRS.to_proj4(self)
     |      Convert to a PROJ4 representation.
     |      
     |              Returns
     |              -------
     |              str
     |  
     |  to_string(...)
     |      CRS.to_string(self)
     |      Convert to a PROJ4 or WKT string.
     |      
     |              The output will be reduced as much as possible by attempting a
     |              match to CRS defined in authority files.
     |      
     |              Notes
     |              -----
     |              Mapping keys are tested against the ``all_proj_keys`` list.
     |              Values of ``True`` are omitted, leaving the key bare:
     |              {'no_defs': True} -> "+no_defs" and items where the value is
     |              otherwise not a str, int, or float are omitted.
     |      
     |              Returns
     |              -------
     |              str
     |      
     |              Raises
     |              ------
     |              CRSError
     |  
     |  to_wkt(...)
     |      CRS.to_wkt(self, morph_to_esri_dialect=False, version=None)
     |      Convert to a OGC WKT representation.
     |      
     |               .. versionadded:: 1.3.0 version
     |      
     |              Parameters
     |              ----------
     |              morph_to_esri_dialect : bool, optional
     |                  Whether or not to morph to the Esri dialect of WKT Only
     |                  applies to GDAL versions < 3. This parameter will be removed
     |                  in a future version of rasterio.
     |              version : WktVersion or str, optional
     |                  The version of the WKT output.
     |                  Only works with GDAL 3+. Default is WKT1_GDAL.
     |      
     |              Returns
     |              -------
     |              str
     |      
     |              Raises
     |              ------
     |              CRSError
     |  
     |  ----------------------------------------------------------------------
     |  Static methods defined here:
     |  
     |  __new__(*args, **kwargs) from builtins.type
     |      Create and return a new object.  See help(type) for accurate signature.
     |  
     |  from_authority(...)
     |      CRS.from_authority(auth_name, code)
     |      Make a CRS from an authority name and code.
     |      
     |              .. versionadded:: 1.1.7
     |      
     |              Parameters
     |              ----------
     |              auth_name: str
     |                  The name of the authority.
     |              code : int or str
     |                  The code used by the authority.
     |      
     |              Returns
     |              -------
     |              CRS
     |      
     |              Raises
     |              ------
     |              CRSError
     |  
     |  from_dict(...)
     |      CRS.from_dict(initialdata=None, **kwargs)
     |      Make a CRS from a dict of PROJ parameters or PROJ JSON.
     |      
     |              Parameters
     |              ----------
     |              initialdata : mapping, optional
     |                  A dictionary or other mapping
     |              kwargs : mapping, optional
     |                  Another mapping. Will be overlaid on the initialdata.
     |      
     |              Returns
     |              -------
     |              CRS
     |      
     |              Raises
     |              ------
     |              CRSError
     |  
     |  from_epsg(...)
     |      CRS.from_epsg(code)
     |      Make a CRS from an EPSG code.
     |      
     |              Parameters
     |              ----------
     |              code : int or str
     |                  An EPSG code. Strings will be converted to integers.
     |      
     |              Notes
     |              -----
     |              The input code is not validated against an EPSG database.
     |      
     |              Returns
     |              -------
     |              CRS
     |      
     |              Raises
     |              ------
     |              CRSError
     |  
     |  from_proj4(...)
     |      CRS.from_proj4(proj)
     |      Make a CRS from a PROJ4 string.
     |      
     |              Parameters
     |              ----------
     |              proj : str
     |                  A PROJ4 string like "+proj=longlat ..."
     |      
     |              Returns
     |              -------
     |              CRS
     |      
     |              Raises
     |              ------
     |              CRSError
     |  
     |  from_string(...)
     |      CRS.from_string(value, morph_from_esri_dialect=False)
     |      Make a CRS from an EPSG, PROJ, or WKT string
     |      
     |              Parameters
     |              ----------
     |              value : str
     |                  An EPSG, PROJ, or WKT string.
     |              morph_from_esri_dialect : bool, optional
     |                  If True, items in the input using Esri's dialect of WKT
     |                  will be replaced by OGC standard equivalents.
     |      
     |              Returns
     |              -------
     |              CRS
     |      
     |              Raises
     |              ------
     |              CRSError
     |  
     |  from_user_input(...)
     |      CRS.from_user_input(value, morph_from_esri_dialect=False)
     |      Make a CRS from a variety of inputs.
     |      
     |              Parameters
     |              ----------
     |              value : object
     |                  User input of many different kinds.
     |              morph_from_esri_dialect : bool, optional
     |                  If True, items in the input using Esri's dialect of WKT
     |                  will be replaced by OGC standard equivalents.
     |      
     |              Returns
     |              -------
     |              CRS
     |      
     |              Raises
     |              ------
     |              CRSError
     |  
     |  from_wkt(...)
     |      CRS.from_wkt(wkt, morph_from_esri_dialect=False)
     |      Make a CRS from a WKT string.
     |      
     |              Parameters
     |              ----------
     |              wkt : str
     |                  A WKT string.
     |              morph_from_esri_dialect : bool, optional
     |                  If True, items in the input using Esri's dialect of WKT
     |                  will be replaced by OGC standard equivalents.
     |      
     |              Returns
     |              -------
     |              CRS
     |      
     |              Raises
     |              ------
     |              CRSError
     |  
     |  ----------------------------------------------------------------------
     |  Data descriptors defined here:
     |  
     |  data
     |      A PROJ4 dict representation of the CRS.
     |  
     |  is_epsg_code
     |      Test if the CRS is defined by an EPSG code.
     |      
     |      Returns
     |      -------
     |      bool
     |  
     |  is_geographic
     |      Test if the CRS is a geographic coordinate reference system.
     |      
     |      Returns
     |      -------
     |      bool
     |      
     |      Raises
     |      ------
     |      CRSError
     |  
     |  is_projected
     |      Test if the CRS is a projected coordinate reference system.
     |      
     |      Returns
     |      -------
     |      bool
     |      
     |      Raises
     |      ------
     |      CRSError
     |  
     |  is_valid
     |      Test that the CRS is a geographic or projected CRS.
     |      
     |      Returns
     |      -------
     |      bool
     |  
     |  linear_units
     |      Get a short name for the linear units of the CRS.
     |      
     |      Returns
     |      -------
     |      units : str
     |          "m", "ft", etc.
     |      
     |      Raises
     |      ------
     |      CRSError
     |  
     |  linear_units_factor
     |      Get linear units and the conversion factor to meters of the CRS.
     |      
     |      Returns
     |      -------
     |      units : str
     |          "m", "ft", etc.
     |      factor : float
     |          Ratio of one unit to one meter.    
     |      
     |      Raises
     |      ------
     |      CRSError
     |  
     |  units_factor
     |      Get units and the conversion factor of the CRS.
     |      
     |      Returns
     |      -------
     |      units : str
     |          "m", "ft", etc.
     |      factor : float
     |          Ratio of one unit to one radian if the CRS is geographic
     |          otherwise, it is to one meter.
     |      
     |      Raises
     |      ------
     |      CRSError
     |  
     |  wkt
     |      An OGC WKT representation of the CRS
     |      
     |      Returns
     |      -------
     |      str
    
    class Env(builtins.object)
     |  Env(session=None, aws_unsigned=False, profile_name=None, session_class=<function Session.aws_or_dummy at 0x7f52e809e7a0>, **options)
     |  
     |  Abstraction for GDAL and AWS configuration
     |  
     |  The GDAL library is stateful: it has a registry of format drivers,
     |  an error stack, and dozens of configuration options.
     |  
     |  Rasterio's approach to working with GDAL is to wrap all the state
     |  up using a Python context manager (see PEP 343,
     |  https://www.python.org/dev/peps/pep-0343/). When the context is
     |  entered GDAL drivers are registered, error handlers are
     |  configured, and configuration options are set. When the context
     |  is exited, drivers are removed from the registry and other
     |  configurations are removed.
     |  
     |  Example
     |  -------
     |  .. code-block:: python
     |  
     |      with rasterio.Env(GDAL_CACHEMAX=128000000) as env:
     |          # All drivers are registered, GDAL's raster block cache
     |          # size is set to 128 MB.
     |          # Commence processing...
     |          ...
     |          # End of processing.
     |  
     |      # At this point, configuration options are set to their
     |      # previous (possible unset) values.
     |  
     |  A boto3 session or boto3 session constructor arguments
     |  `aws_access_key_id`, `aws_secret_access_key`, `aws_session_token`
     |  may be passed to Env's constructor. In the latter case, a session
     |  will be created as soon as needed. AWS credentials are configured
     |  for GDAL as needed.
     |  
     |  Methods defined here:
     |  
     |  __enter__(self)
     |  
     |  __exit__(self, exc_type=None, exc_val=None, exc_tb=None)
     |  
     |  __init__(self, session=None, aws_unsigned=False, profile_name=None, session_class=<function Session.aws_or_dummy at 0x7f52e809e7a0>, **options)
     |      Create a new GDAL/AWS environment.
     |      
     |      Note: this class is a context manager. GDAL isn't configured
     |      until the context is entered via `with rasterio.Env():`
     |      
     |      Parameters
     |      ----------
     |      session : optional
     |          A Session object.
     |      aws_unsigned : bool, optional
     |          Do not sign cloud requests.
     |      profile_name : str, optional
     |          A shared credentials profile name, as per boto3.
     |      session_class : Session, optional
     |          A sub-class of Session.
     |      **options : optional
     |          A mapping of GDAL configuration options, e.g.,
     |          `CPL_DEBUG=True, CHECK_WITH_INVERT_PROJ=False`.
     |      
     |      Returns
     |      -------
     |      Env
     |      
     |      Notes
     |      -----
     |      We raise EnvError if the GDAL config options
     |      AWS_ACCESS_KEY_ID or AWS_SECRET_ACCESS_KEY are given. AWS
     |      credentials are handled exclusively by boto3.
     |      
     |      Examples
     |      --------
     |      
     |      >>> with Env(CPL_DEBUG=True, CPL_CURL_VERBOSE=True):
     |      ...     with rasterio.open("https://example.com/a.tif") as src:
     |      ...         print(src.profile)
     |      
     |      For access to secured cloud resources, a Rasterio Session or a
     |      foreign session object may be passed to the constructor.
     |      
     |      >>> import boto3
     |      >>> from rasterio.session import AWSSession
     |      >>> boto3_session = boto3.Session(...)
     |      >>> with Env(AWSSession(boto3_session)):
     |      ...     with rasterio.open("s3://mybucket/a.tif") as src:
     |      ...         print(src.profile)
     |  
     |  credentialize(self)
     |      Get credentials and configure GDAL
     |      
     |      Note well: this method is a no-op if the GDAL environment
     |      already has credentials, unless session is not None.
     |      
     |      Returns
     |      -------
     |      None
     |  
     |  drivers(self)
     |      Return a mapping of registered drivers.
     |  
     |  ----------------------------------------------------------------------
     |  Class methods defined here:
     |  
     |  default_options() from builtins.type
     |      Default configuration options
     |      
     |      Parameters
     |      ----------
     |      None
     |      
     |      Returns
     |      -------
     |      dict
     |  
     |  from_defaults(*args, **kwargs) from builtins.type
     |      Create an environment with default config options
     |      
     |      Parameters
     |      ----------
     |      args : optional
     |          Positional arguments for Env()
     |      kwargs : optional
     |          Keyword arguments for Env()
     |      
     |      Returns
     |      -------
     |      Env
     |      
     |      Notes
     |      -----
     |      The items in kwargs will be overlaid on the default values.
     |  
     |  ----------------------------------------------------------------------
     |  Data descriptors defined here:
     |  
     |  __dict__
     |      dictionary for instance variables (if defined)
     |  
     |  __weakref__
     |      list of weak references to the object (if defined)

FUNCTIONS
    band(ds, bidx)
        A dataset and one or more of its bands
        
        Parameters
        ----------
        ds: dataset object
            An opened rasterio dataset object.
        bidx: int or sequence of ints
            Band number(s), index starting at 1.
        
        Returns
        -------
        rasterio.Band
    
    open(fp, mode='r', driver=None, width=None, height=None, count=None, crs=None, transform=None, dtype=None, nodata=None, sharing=False, **kwargs)
        Open a dataset for reading or writing.
        
        The dataset may be located in a local file, in a resource located by
        a URL, or contained within a stream of bytes.
        
        In read ('r') or read/write ('r+') mode, no keyword arguments are
        required: these attributes are supplied by the opened dataset.
        
        In write ('w' or 'w+') mode, the driver, width, height, count, and dtype
        keywords are strictly required.
        
        Parameters
        ----------
        fp : str, file object, PathLike object, FilePath, or MemoryFile
            A filename or URL, a file object opened in binary ('rb') mode, a
            Path object, or one of the rasterio classes that provides the
            dataset-opening interface (has an open method that returns a
            dataset).
        mode : str, optional
            'r' (read, the default), 'r+' (read/write), 'w' (write), or
            'w+' (write/read).
        driver : str, optional
            A short format driver name (e.g. "GTiff" or "JPEG") or a list of
            such names (see GDAL docs at
            https://gdal.org/drivers/raster/index.html). In 'w' or 'w+' modes
            a single name is required. In 'r' or 'r+' modes the driver can
            usually be omitted. Registered drivers will be tried
            sequentially until a match is found. When multiple drivers are
            available for a format such as JPEG2000, one of them can be
            selected by using this keyword argument.
        width : int, optional
            The number of columns of the raster dataset. Required in 'w' or
            'w+' modes, it is ignored in 'r' or 'r+' modes.
        height : int, optional
            The number of rows of the raster dataset. Required in 'w' or
            'w+' modes, it is ignored in 'r' or 'r+' modes.
        count : int, optional
            The count of dataset bands. Required in 'w' or 'w+' modes, it is
            ignored in 'r' or 'r+' modes.
        crs : str, dict, or CRS; optional
            The coordinate reference system. Required in 'w' or 'w+' modes,
            it is ignored in 'r' or 'r+' modes.
        transform : Affine instance, optional
            Affine transformation mapping the pixel space to geographic
            space. Required in 'w' or 'w+' modes, it is ignored in 'r' or
            'r+' modes.
        dtype : str or numpy dtype
            The data type for bands. For example: 'uint8' or
            ``rasterio.uint16``. Required in 'w' or 'w+' modes, it is
            ignored in 'r' or 'r+' modes.
        nodata : int, float, or nan; optional
            Defines the pixel value to be interpreted as not valid data.
            Required in 'w' or 'w+' modes, it is ignored in 'r' or 'r+'
            modes.
        sharing : bool; optional
            To reduce overhead and prevent programs from running out of file
            descriptors, rasterio maintains a pool of shared low level
            dataset handles. When `True` this function will use a shared
            handle if one is available. Multithreaded programs must avoid
            sharing and should set *sharing* to `False`.
        kwargs : optional
            These are passed to format drivers as directives for creating or
            interpreting datasets. For example: in 'w' or 'w+' modes
            a `tiled=True` keyword argument will direct the GeoTIFF format
            driver to create a tiled, rather than striped, TIFF.
        
        Returns
        -------
        A ``DatasetReader`` or ``DatasetWriter`` object.
        
        Examples
        --------
        
        To open a GeoTIFF for reading using standard driver discovery and
        no directives:
        
        >>> import rasterio
        >>> with rasterio.open('example.tif') as dataset:
        ...     print(dataset.profile)
        
        To open a JPEG2000 using only the JP2OpenJPEG driver:
        
        >>> with rasterio.open(
        ...         'example.jp2', driver='JP2OpenJPEG') as dataset:
        ...     print(dataset.profile)
        
        To create a new 8-band, 16-bit unsigned, tiled, and LZW-compressed
        GeoTIFF with a global extent and 0.5 degree resolution:
        
        >>> from rasterio.transform import from_origin
        >>> with rasterio.open(
        ...         'example.tif', 'w', driver='GTiff', dtype='uint16',
        ...         width=720, height=360, count=8, crs='EPSG:4326',
        ...         transform=from_origin(-180.0, 90.0, 0.5, 0.5),
        ...         nodata=0, tiled=True, compress='lzw') as dataset:
        ...     dataset.write(...)
    
    pad(array, transform, pad_width, mode=None, **kwargs)
        pad array and adjust affine transform matrix.
        
        Parameters
        ----------
        array: ndarray
            Numpy ndarray, for best results a 2D array
        transform: Affine transform
            transform object mapping pixel space to coordinates
        pad_width: int
            number of pixels to pad array on all four
        mode: str or function
            define the method for determining padded values
        
        Returns
        -------
        (array, transform): tuple
            Tuple of new array and affine transform
        
        Notes
        -----
        See numpy docs for details on mode and other kwargs:
        http://docs.scipy.org/doc/numpy-1.10.0/reference/generated/numpy.pad.html

DATA
    __all__ = ['band', 'open', 'pad', 'Env', 'CRS']
    __gdal_version__ = '3.6.3'
    __geos_version__ = '3.11.2'
    __proj_version__ = '9.1.1'

VERSION
    1.3.6

FILE
    /home/mfisher/miniconda3/envs/qgreenland-researcher-workshop/lib/python3.11/site-packages/rasterio/__init__.py


```


# Inspection with QGIS

* You can use QGIS to inspect both raster and vector data
* You can compare this data to other layers, e.g. basemap.

::: {.notes}
This can be a pitfall; if the datum differs from other layers, there could be
discrepancies that are hard to detect. When doing an analysis, transform all layers to
the same datum using e.g. `gdalwarp`, `ogr2ogr`.
:::


## QGIS Layer Properties

![CRS of a QGreenland layer](/_media/qgreenland_layer_properties.png)

::: {.notes}
In QGIS, right click a layer -> "Properties"

Here you can find abstract, file format ("Storage"), CRS, spatial extent, distance
units, feature count, geometry type(s), grid width & height, data type, fill value,
grid pixel size, grid origin, and more.
:::


# Raster data inspection tools

## Raster data inspection: `gdalinfo`

One of the most commonly-available tools, and is used under-the-hood by many other
tools.

* <https://gdal.org/programs/gdalinfo.html>
* `gdalinfo --help`
* `man gdalinfo`


## Raster data inspection: `gdalinfo`

<!-- TODO: Should we use a small dataset that we can include in the Git repository,
and actually run these operations at Quarto render-time? Or one that can be
downloaded to `/tmp` at render-time? -->

``` {.default code-line-numbers="false"}
gdalinfo bedmachine_bed.tif
```

``` {.default code-line-numbers="1-3|4|5,6|44|47|48-86|96|99|100|101|102-114"}
Driver: GTiff/GeoTIFF
Files: bedmachine_bed.tif
       bedmachine_bed.tif.aux.xml
Size is 14844, 21876
Coordinate System is:
PROJCRS["WGS 84 / NSIDC Sea Ice Polar Stereographic North",
    BASEGEOGCRS["WGS 84",
        DATUM["World Geodetic System 1984",
            ELLIPSOID["WGS 84",6378137,298.257223563,
                LENGTHUNIT["metre",1]]],
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
        SCOPE["unknown"],
        AREA["World - N hemisphere - north of 60°N"],
        BBOX[60,-180,90,180]],
    ID["EPSG",3413]]
Data axis to CRS axis mapping: 1,2
Origin = (-997978.940007228753529,-329743.070899212907534)
Pixel Size = (149.996827426226332,-149.996827426226389)
Metadata:
  AREA_OR_POINT=Area
  bed#grid_mapping=mapping
  bed#long_name=bed topography
  bed#source=Mass conservation (Mathieu Morlighem)
  bed#standard_name=bedrock_altitude
  bed#units=meters
  bed#_FillValue=-9999
  mapping#false_easting=0
  mapping#false_northing=0
  mapping#geoid=eigen-6c4
  mapping#grid_mapping_name=polar_stereographic
  mapping#inverse_flattening=298.2794050428205
  mapping#latitude_of_projection_origin=90
  mapping#semi_major_axis=6378273
  mapping#standard_parallel=70
  mapping#straight_vertical_longitude_from_pole=-45
  NC_GLOBAL#Author=Mathieu Morlighem
  NC_GLOBAL#Conventions=CF-1.7
  NC_GLOBAL#Data_citation=Morlighem M. et al., (2017), BedMachine v3: Complete bed topography and ocean bathymetry mapping of Greenland from multi-beam echo sounding combined with mass conservation, Geophys. Res. Lett., 44, doi:10.1002/2017GL074954. (http://onlinelibrary.wiley.com/doi/10.1002/2017GL074954/full)
  NC_GLOBAL#ice_density (kg m-3)=917
  NC_GLOBAL#license=No restrictions on access or use
  NC_GLOBAL#no_data=-9999
  NC_GLOBAL#nx=10218
  NC_GLOBAL#ny=18346
  NC_GLOBAL#proj4=+init=epsg:3413
  NC_GLOBAL#Projection=Polar Stereographic North (70N, 45W)
  NC_GLOBAL#sea_water_density (kg m-3)=1023
  NC_GLOBAL#spacing=150
  NC_GLOBAL#Title=BedMachine Greenland
  NC_GLOBAL#version=20-Apr-2021 (v4.10)
  NC_GLOBAL#xmin=-652925
  NC_GLOBAL#ymax=-632675
  x#long_name=Cartesian x-coordinate
  x#standard_name=projection_x_coordinate
  x#units=meter
  y#long_name=Cartesian y-coordinate
  y#standard_name=projection_y_coordinate
  y#units=meter
Image Structure Metadata:
  COMPRESSION=DEFLATE
  INTERLEAVE=BAND
Corner Coordinates:
Upper Left  ( -997978.940, -329743.071) (116d42'57.18"W, 80d19'10.86"N)
Lower Left  ( -997978.940,-3611073.668) ( 60d26'56.41"W, 56d22'33.59"N)
Upper Right ( 1228573.966, -329743.071) ( 29d58'34.22"E, 78d17'47.47"N)
Lower Right ( 1228573.966,-3611073.668) ( 26d12'37.67"W, 55d48' 2.10"N)
Center      (  115297.513,-1970408.369) ( 41d39' 4.26"W, 71d55'29.45"N)
Band 1 Block=256x256 Type=Float32, ColorInterp=Gray
  Min=-5571.673 Max=3672.355
  Minimum=-5571.673, Maximum=3672.355, Mean=-307.314, StdDev=1161.000
  NoData Value=-9999
  Overviews: 7422x10938, 3711x5469, 1856x2735, 928x1368
  Unit Type: meters
  Metadata:
    grid_mapping=mapping
    long_name=bed topography
    NETCDF_VARNAME=bed
    source=Mass conservation (Mathieu Morlighem)
    standard_name=bedrock_altitude
    STATISTICS_MAXIMUM=3672.35546875
    STATISTICS_MEAN=-307.31420082049
    STATISTICS_MINIMUM=-5571.6728515625
    STATISTICS_STDDEV=1160.9999064556
    STATISTICS_VALID_PERCENT=57.73
    units=meters
    _FillValue=-9999
```

::: {.notes}
* Grid size, in "pixels"
* Well-Known Text represents CRS with hierarchical data, which `gdalinfo`
  nicely indents for us. The "top-level" EPSG is shown as 3413.
* Pixel size, in projected units
* Global metadata: These are metadata that were included in the original NetCDF
  source dataset. We'll discuss more about this pitfall in the
  "Transformations" module.
* Band metadata
* Overviews: Various down-sampled versions of the data for performance when
  zoomed out.
:::


## Raster data inspection: Rasterio CLI

`rio info --help`

``` {.default code-line-numbers="false"}
$ rio info --crs bedmachine_bed.tif
EPSG:3413

$ rio info --dtype bedmachine_bed.tif
float32

$ rio info --nodata bedmachine_bed.tif
-9999.0

$ rio info --shape bedmachine_bed.tif
21876 14844
```

::: {.notes}
Rasterio provides both a CLI and Python interface. We'll look at the Python interface
next.
:::


## Raster data inspection: Rasterio Python

`import rasterio; help(rasterio)`

``` {.default code-line-numbers="false"}
python
```

```default
Python 3.11.0 | packaged by conda-forge | (main, Jan 14 2023, 12:27:40) [GCC 11.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import rasterio
>>> ds = rasterio.open('bedmachine_bed.tif')
>>> ds.crs
CRS.from_epsg(3413)
>>> ds.dtypes
('float32',)
>>> ds.nodata
-9999.0
>>> ds.shape
(21876, 14844)
>>> ds.close()
```

::: {.notes}
Normally, you would use a context manager to open a file with rasterio. Since
we didn't do that here, we must manually close the file.
:::


## Raster data inspection with Xarray (rioxarray)

`import xarray; help(xarray)`

``` {.default code-line-numbers="false"}
>>> import rioxarray
>>> import xarray as xra
>>> ds = xra.open_dataset('bedmachine_bed.tif')
>>> ds
<xarray.Dataset>
Dimensions:  (band: 1, x: 14844, y: 21876)
Coordinates:
  * band     (band) int64 1
  * x        (x) float64 -9.979e+05 -9.978e+05 ... 1.228e+06 1.228e+06
  * y        (y) float64 -3.298e+05 -3.3e+05 ... -3.611e+06 -3.611e+06
    mapping  int64 ...
Data variables:
    bed      (band, y, x) float32 ...
>>> ds.rio.crs
CRS.from_epsg(3413)
```

::: {.notes}
`rioxarray` provides geospatial awareness to `xarray`.
:::


# Vector data inspection tools

## Vector data inspection: `ogrinfo`

* <https://gdal.org/programs/ogrinfo.html>
* `ogrinfo --help`
* `man ogrinfo`

::: {.notes}
"OGR" used to stand for "OpenGIS Simple Features Reference Implementation" but
is now the name is "OGR Simple Features Library". "OGR" is left for historical
reasons. [OSGeo GDAL
FAQ](https://trac.osgeo.org/gdal/wiki/FAQGeneral#WhatdoesOGRstandfor)
:::


## Vector data inspection: `ogrinfo`

``` {.default code-line-numbers="false"}
gdalinfo -al -so populated_places.gpkg
```

``` {.default code-line-numbers="1-2|4|5|6|7|8|55|57-85"}
INFO: Open of `populated_places.gpkg'
      using driver `GPKG' successful.

Layer name: SELECT
Geometry: Point
Feature Count: 83
Extent: (-605594.054592, -3322344.525361) - (837631.269958, -1140855.537211)
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
ID: Integer64 (0.0)
New Greenlandic: String (0.0)
Old Greenlandic: String (0.0)
Danish: String (0.0)
Alternative placename: String (0.0)
Object designation: String (0.0)
Source: String (0.0)
Municipality: String (0.0)
Notes: String (0.0)
Date of registration: String (0.0)
Modification date: String (0.0)
Authorized: String (0.0)
Authorized date: String (0.0)
Project manager: String (0.0)
KMS_id: String (0.0)
Latitude: Real (0.0)
Longitude: Real (0.0)
Card: String (0.0)
Namer: String (0.0)
Namesake: String (0.0)
Meaning of the placename: String (0.0)
Placename history: String (0.0)
Danish explanation of Object designation: String (0.0)
Greenlandic explanation of Object designation: String (0.0)
English explanation of Object designation: String (0.0)
Translation notes: String (0.0)
label: String (0.0)
```

::: {.notes}
* `-al`: All layers
* `-so`: Summary only; don't list individual features.
* GeoPackages (`GPKG`) are a special extension to SQLite databases.
* There may be many layers, but this particular GeoPackage just has one called
  "SELECT", which is a poor name.
* Like `gdalinfo`, the CRS is in WKT. First thing to look for is a "top-level"
  EPSG code.
* These are attribute table columns and their datatypes.
:::


## Vector data inspection: Fiona

_TODO: Verify Fiona is in our JupyterHub environment._

``` {.default code-line-numbers="false"}
python
```

``` {.default code-line-numbers="3-4|5-6|7-8|10-19|20"}
Python 3.11.0 | packaged by conda-forge | (main, Jan 14 2023, 12:27:40) [GCC 11.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import fiona
>>> ds = fiona.open('populated_places.gpkg')
>>> ds.profile['crs']
CRS.from_epsg(3413)
>>> ds.profile['driver']
'GPKG'
>>> from pprint import pprint
>>> pprint(ds.profile['schema'])
{'geometry': 'Point',
 'properties': {'Alternative placename': 'str',
                'Authorized': 'str',
                'Authorized date': 'str',
                'Card': 'str',
                'Danish': 'str',
                <... trimmed to save space ...>
                'Translation notes': 'str',
                'label': 'str'}}
>>> ds.close()
```

::: {.notes}
* `profile` attribute contains metadata.
* The "schema" includes geometry type and attribute table fields.
* It's important to either use a context manager or manually close your dataset.
:::


# Example: raster with no metadata

## Raster with no metadata: `gdalinfo` {.smaller}

_Please note: This dataset was intentionally modified to remove metadata. This example
does not reflect the quality of the [original
dataset](https://nsidc.org/data/nsidc-0092/versions/1)._

``` {.default code-line-numbers="false"}
gdalinfo content/examples/data-scenarios/missing-metadata/dem_without_metadata.tif
```

``` {.default code-line-numbers="1-2|3|9-13"}
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

No Coordinate Reference System is specified!

::: {.notes}
* Size is in grid space.
* Corner coordinates are in grid space.
    * NOTE: the upper-left corner coordinates are `(0, 0)`; this is a red flag that the
      data is not properly geolocated.
* There is no WKT or other specification of a coordinate reference system.
:::


## Raster with no metadata: Rasterio CLI

``` {.default code-line-numbers="false"}
rio info --crs dem_without_metadata.tif
```

```default
/home/mfisher/miniconda3/envs/xarray/lib/python3.11/site-packages/rasterio/__init__.py:304:
NotGeoreferencedWarning: Dataset has no geotransform, gcps, or rpcs. The identity matrix
will be returned.
  dataset = DatasetReader(path, driver=driver, sharing=sharing, **kwargs)
```

This error message tells us that geolocation metadata was not found in the dataset.

::: {.notes}
We won't talk about "GCPs" (Ground Control Points) or "RPCs" (Rational Polynomial
Coefficients).
:::
