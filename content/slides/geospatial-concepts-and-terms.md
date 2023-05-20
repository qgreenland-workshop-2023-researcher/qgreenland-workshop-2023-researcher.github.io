---
title: "Review: Geospatial concepts and terms"
subtitle: "QGreenland Researcher Workshop 2023"
index: 20
background-image: "https://live.staticflickr.com/65535/50237698987_d346b23e9b_k.jpg"
---

# Geospatial data

![Vector vs Raster](https://pygis.io/_images/vector_vs_raster.jpg)

::: {.notes}
Two main representations of geospatial data: vector and raster.
:::


## Vector data

Choose the right feature type:

* Point
* Line
* Polygon

![Vector map (Wikimedia Commons)](https://upload.wikimedia.org/wikipedia/commons/3/38/Simple_vector_map.svg)


## Vector attributes

::: {.r-fit-text}
Attributes add additional data to a geospatial element

* A point representing a weather station may have a `temperature` attribute
* a line representing a river may have a `name` attribute
* A polygon representing a state may have a `population` attribute
:::

![Attribute table for the "Human activity/Research sites/GEM research stations"
point layer in
QGreenland](/_media/qgreenland_GEM-research-stations_attribute_table.png)


## Vector topology {.smaller}

* Spatial relationships between vector features.
* E.g,
  * "what points fall within a given polygon?"
  * "What polygons are adjacent to this one?"

![Examples of topological spatial relations (Wikimedia
Commons)](https://upload.wikimedia.org/wikipedia/commons/5/55/TopologicSpatialRelarions2.png)

::: {.notes}
_TODO: keep this slide here? Day 3? Or remove? This is more about analysis with
vector features. Another thing to think about: vector validity (e.g.,
non-self-crossing lines)?_
:::


## Raster data

* Continuous: temperature, sea ice concentration, wind speed
* Categorical: land cover, cloud type, storm category

![RGB Raster Image (Wikimedia Commons)](https://upload.wikimedia.org/wikipedia/commons/3/3b/Rgb-raster-image.svg)

:::{.notes}
* Rasters can sometimes contain a mix of continuous and categorical data (a
  measure plus flag values, e.g., sea ice concentration with "land", "coast",
  "lake" flags).

* The symbology of raster data may be categorical while the underlying data is
  continuous (e.g., high/medium/low sea ice concentration).
:::


## Continuous raster data

![Continuous data image](/_media/qgreenland_seaice_concentration_feb2015.png)


## Categorical raster data

![US Land Cover Classification](https://d9-wret.s3.us-west-2.amazonaws.com/assets/palladium/production/s3fs-public/thumbnails/image/NLCD_2016_Landcover.jpg)


# Metadata

Data about data

::: {.notes}
Metadata is "data about data", and is how standards-compliant data files
"self-describe".

For example, this data is in "North Polar Stereographic" projection.
:::

## Geospatial metadata concepts

* Location: where does a feature occur in space/on the Earth.
* Time: when did the feature occur?
* Provenance: Where did the data come from and what kind of processing was applied?
* Measurement information
  * What units of measure is the feature recorded in?
  * "Missing/No Data" and other flags

# Coordinate Reference System (CRS) information

Includes all of the information necessary to accurately locate features on Earth.

::: {.callout-note}
**Coordinate Reference System (CRS)** == **Spatial Reference System (SRS)**
:::


## Geodetic Datums

::: {.r-fit-text}
A model representation of the Earth serving as a reference for locating features.

* Often a spherical or ellipsoidal representation.
* Horizontal and/or vertical.
* `WGS84` is a common global datum, but many others (including locally best-fitting models).
* Differences between datums can be significant (> 100 meters in some cases).
:::

![Global and regional ellipsoids (Wikimedia
Commons)](https://upload.wikimedia.org/wikipedia/commons/thumb/b/b2/Gloabl_and_Regional_Ellipsoids.svg/256px-Gloabl_and_Regional_Ellipsoids.svg.png)


::: {.notes}
_Datum shift_ is the difference in lat/lon of a location between different
datums. E.g., a surveyed location will have different lat/lon values under
different datums, sometimes resulting in significant differences (> 100 meters in some
cases).

_TODO: can we find a better image that shows differences between Earth, ellipsoid, and geoid?_
:::


## Geographic Coordinate System (GCS)

Coordinate system that represents locations on the Earth in spherical
coordinates of latitudes and longitudes.

![Diagram of the latitude ϕ and longitude λ angle measurements for a spherical
model of the Earth (Wikimedia
Commons)](https://upload.wikimedia.org/wikipedia/commons/thumb/8/83/Latitude_and_longitude_graticule_on_a_sphere.svg/1024px-Latitude_and_longitude_graticule_on_a_sphere.svg.png)

::: {.notes}
By default in programs like QGIS, data referenced to a Geographic Coordinate
System (unprojected) are shown in an 'equirectangular' projection in which
latitudes are mapped to the Y axis and longitudes are mapped to the X axis of a
planar coordinate system.
:::


## Projected Coordinate System (PCS)

::: {.r-fit-text}
Coordinate system that represents locations on the Earth in planar coordinates (X, Y).

* Projection is the transformation of spherical (lat/lon) coordinates to a planar surface.
* Benefits include visualization on flat surfaces (e.g., maps) and simplified distance calculations.
* Projection results in one or more distortions: shape, area, distance, direction
:::

:::::: {.columns}
:::{.column}

![Comparison of different forms of Mercator projections (Wikimedia
Commons)](https://upload.wikimedia.org/wikipedia/commons/b/b5/Comparison_of_Mercator_projections.svg){width="60%"}
:::

:::{.column}
![Tissot's Indicatrices on the Mercator projection (Wikimedia
Commons)](https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Mercator_with_Tissot%27s_Indicatrices_of_Distortion.svg/1024px-Mercator_with_Tissot%27s_Indicatrices_of_Distortion.svg.png){width="60%"}
:::
::::::


::: {.notes}
A projection is an algorithm (e.g., stereographic) and its parameters (e.g,
lat/lon of origin, units, etc).

[A PCS is a GCS with a map
projection](https://pro.arcgis.com/en/pro-app/latest/help/mapping/properties/coordinate-systems-and-projections.htm).

There are MANY map projections. Each has advantages and disadvantages depending
on use-case and the part of the world being mapped.

* _TODO: how do size images so that they take up the remaining space?_
:::


## {background-iframe="https://www.jasondavies.com/maps/transition/" background-interactive="true"}

::: {.notes}
Website demonstrates many different projections with an interactive control to change the perspective.

You may have trouble advancing this slide. Try clicking in the title bar of the
application or on the slide "page number" in the top-right. You should also be able to
advance the deck from the speaker notes window.
:::


## Standard representations of CRS information

### [Well Known Text (WKT)](https://www.ogc.org/standard/wkt-crs/) 🌎
```{.text code-line-numbers="false"}
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
```
::: {.notes}
WKT is highly verbose and relatively readable to humans.
:::


## Standard representations of CRS information

### [Proj parameters](https://proj.org/usage/projections.html)
```{.text code-line-numbers="false"}
+proj=stere +lat_0=90 +lat_ts=70 +lon_0=-45 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs
```
::: {.notes}
Proj parameters encode CRS parameters as key-value pairs.
:::


## Standard representations of CRS information

<!-- alex ignore european -->
### [European Petroleum Survey Group (EPSG) Geodetic Parameter Dataset codes](https://epsg.org/home.html)
```{.text code-line-numbers="false"}
EPSG:3413
```
::: {.notes}
Extremely concise, EPSG maintains a registry of codes that map to CRS definitions in a standard database used by tools like `gdal`.

Note there are other standard representations as well, e.g., Geography Markup Language (GML). The three listed here (WKT, Proj, EPSG codes) are some of the most common.
:::


## Metadata standards

When a dataset follows of one or more common standards, GIS practitioners and
tools can accurately parse information about CRS, date/time, etc.

See the [Continued
learning](/content/continued-learning.html#data-and-metadata-standards) page for
examples of common standards.

:::{.notes}
Standards for metadata are often context-dependent. Some standards are developed
for particular data formats, others are focused on certain scientific domains
(e.g, Ecological Markup Language, EML).
:::
