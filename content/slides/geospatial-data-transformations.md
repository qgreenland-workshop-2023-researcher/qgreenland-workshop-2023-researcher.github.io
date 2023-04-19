---
title: "Geospatial data transformations"
subtitle: "QGreenland Researcher Workshop 2023"
background-image: "/_media/DMS_1842643_12758_20180418_18111267_clipped.jpg"
title-slide-attributes:
  data-background-image: "/_media/DMS_1842643_12758_20180418_18111267_clipped.jpg"
---

## What tool should I use?

The best one for the job.

Explore the alternatives available in the ecosystem you want to work!

::: {.notes}
You may recognize this slide from the "data inspection" deck.

Tool selection is context-dependent.

Command-line tools are especially useful for getting a quick answer.

Language-specific tools are good for automations or research code. These
examples use Python because that's what we're most familiar with, but explore
your preferred ecosystem and you'll find equivalents.
:::


# Transformation concepts {.smaller}

It's important that different datasets are compatible with each-other prior to analysis.

* All datasets should be in the same projection and datum
* Rasters should be "co-registered": matching grids
* Understand your transformations! Some can be "lossy"
* Optional: Don't keep data you don't need

::: {.notes}
Raster "co-registration" means multiple datasets have the same grid resolution and
orientation.

"Lossy" transformations can't be reversed.
:::


## Reprojection

![Reprojection (via [PyGIS](https://pygis.io/docs/d_vector_crs_intro.html))](https://pygis.io/_images/d_reprojection_example.jpg){.center}

::: {.notes}
When reprojecting, we always use geographic coordinates as an intermediate step.
:::


## On-the-fly reprojection

* Useful, but costly especially for large datasets.

* **Could cause unexpected results**: Is your tool acting on reprojected data or source
  data (what's actually on disk)?

* [Learn more about how QGIS does on-the-fly reprojection](https://docs.qgis.org/3.28/en/docs/training_manual/vector_analysis/reproject_transform.html?highlight=reprojecting#basic-fa-on-the-fly-reprojection)

::: {.notes}
On-the-fly reprojection is reprojection that's done implicitly; some GIS tools will use
OTFR to do an analysis between two datasets, and some other GIS tools will do OTFR to
facilitate visualization (e.g. QGIS). It's possible reprojection is happening without
your knowledge.

With OTFR, some choices are likely being made for you: Interpolation algorithm,
re-sampling algorithm, etc. Therefore, when doing analysis, know your tools! For most
analyses, it's helpful to ensure all datasets are in a common projection/datum.

In QGIS, OTFR is automatically enabled; all layers will be reprojected to the chosen
project CRS.
:::


## Reprojection pitfalls {.smaller}

Reprojection is typically lossy!

* When raster data is warped, data points are not mapped 1:1.
* Vector reprojection only affects vertices / points.

:::::: {.columns}
::: {.column width="50%"}
![A "warped" reprojection (via [PyGIS](https://pygis.io/docs/d_vector_crs_intro.html))](https://pygis.io/_images/d_warp.png){width=300px}
:::

::: {.column width="50%"}
![QGreenland's "Greenland-focused boundary" polygon](/_media/qgreenland_boundary_3413.png){width=150px}

![Reprojected to EPSG:4326](/_media/qgreenland_boundary_4326.png){width=400px}
:::
::::::

::: {.notes}
* Once you've reprojected your data once, you can't necessarily go back to the original
  projection and get the same result. Think about pixel interpolation: it's impossible
  to mix two colors and then reverse the process. It's also impossible to know the
  spatial relationship of the original two colors (which was on the left, and which was
  on the right?). You can estimate, but you can't _know_.

* When reprojecting vector data, the points move, but the edges are still straight lines
  between the points, even if they should logically be curved after the reprojection.
  You will lose topological information; e.g. a point could be inside a polygon
  pre-reprojection, and outside the polygon after.
:::


## Reprojection pitfalls {.smaller}

Weird things happen at the edges!

* Vector geometry can become invalid.
* Raster data can show a "seam" where edges are warped together.

![A "seam" along 180 degrees longitude in QGreenland's Natural Earth basemap](/_media/qgreenland_ne_reprojection_seam.png)

<!-- TODO:
* Consider manufacturing an example, e.g. make a raster with 3x3 grid, then calculate a
  polygon matching the shape of each pixel in that grid. Finally, reproject both: This
  will show how the edges of the old pixels don't match the edges of the new pixels.
* Consider how we could visualize vector geometry invalidating during reproject.
--->

::: {.notes}
* Vector geometry can become invalid after reprojection. Imagine a shape in
  polar stereographic projection which crosses the anti-meridian. Reprojecting
  that to EPSG:4326 would require splitting that shape in two.

* Raster data can have a barely-visible "seam" after reprojection. For example,
  data in EPSG:4326 has edges at the antimeridian, and when reprojecting to
  EPSG:3413 those edges have to meet somewhere, and at that location you may
  see a seam. You can see these types of artifacts in Google Earth.
:::


## Resampling

Raster grids won't always align, even in the same projection & datum.

![Resampling - different origin (via [PyGIS](https://pygis.io/docs/d_vector_crs_intro.html))](https://pygis.io/_images/Raster_diff-orientation.jpg)

::: {.notes}
It's important to correct this problem before analysis so that you can be sure that
your computations across datasets will be successful.
:::

---

![Resampling - different origin and rotation (via [PyGIS](https://pygis.io/docs/d_vector_crs_intro.html))](https://pygis.io/_images/Raster_diff-orientation-origin.jpg)

---

![Resampling - different resolution (via [PyGIS](https://pygis.io/docs/d_vector_crs_intro.html))](https://pygis.io/_images/Raster_diff-res.jpg)


## Subsetting (clipping)

Consider doing a subset _first_. Don't waste time and computing power doing analysis on
areas you don't care about!

![QGreenland's Natural Earth 2 basemap without subsetting. QGreenland's area of interest
is the tiny circle in the center!](/_media/qgreenland_ne_no_subset.png)

::: {.notes}
Reprojection is expensive. If you subset first, it will take much less time! You may
want to consider doing a performance-motivated subset, then reprojecting, then
subsetting again in the new projection to get your final area of interest.
:::


## Conversion

Does your data provide a suitable representation for your analysis?

![Johannes Rössel, CC BY-SA 3.0 <https://creativecommons.org/licenses/by-sa/3.0>, via Wikimedia Commons](https://upload.wikimedia.org/wikipedia/commons/c/c2/Raster_vector_tikz.svg)

::: {.notes}
For example, if you're trying to determine the area of a region or whether two phenomena
intersect, raster may not be a suitable representation. Similarly, if you're trying to
calculate an average scalar value, e.g. temperature or ice sheet thickness, over an
area, vector may not be a suitable representation.
:::

<!-- TODO:
* Do an example of rasterizing categorical vector data; show what happens when
  you interpolate incorrectly. Make this a data scenario. Add categories to data
  scenarios to separate transformation scenarios from metadata scenarios.
-->


## Conversion: Vector to raster

### Spatial interpolation

![[(a) Ice thickness map from kriging the Lamont-Doherty (black lines) and CReSIS data
(grey lines). (b) Bed topography calculated from subtracting the interpolated ice
thickness from the GIMP surface elevation DEM. A in Figure 2b highlights the subglacial
overdeepening where major water rerouting
occurs.](https://www.researchgate.net/figure/a-Ice-thickness-map-from-kriging-the-Lamont-Doherty-black-lines-and-CReSIS-data-grey_fig2_301577584)](https://www.researchgate.net/profile/Timothy-Creyts/publication/301577584/figure/fig2/AS:787517137776641@1564770125447/a-Ice-thickness-map-from-kriging-the-Lamont-Doherty-black-lines-and-CReSIS-data-grey.png)

::: {.notes}
Disregard image (b); In image (a) we can see IceBridge flightlines represented in grey.
These flightlines are taking continuous measurements of ice thickness underneath the
plane, so there are no measurements where the plane hasn't flown. Here a process called
"kriging" is used to estimate ice thickness in between measurements.
:::


## Conversion: Raster to vector

![QGreenland's Heat Flux layer (raster) with contours overlaid](/_media/qgreenland_heat_flux_contours.png)

::: {.notes}
You may want to do this for:

* Clumping regions of same value, e.g. contours.
* Clumping regions with similar aggregate value, e.g. find region shapes that each
  contain ~1000 people.
* Calculating the shape of an anomalous region and analyzing other attributes of that
  region.
* Convert a categorical raster image into vector regions.
:::


# Application

## Data scenario: Raster needs reprojection

[Link](/content/exercises/data-scenarios/raster-needs-reprojection)

::: {.notes}
* Review the scenario on the website by clicking the link in this slide.
* Point out the ambiguity of the scenario is typical of a real collaboration. We'll see
  later that we don't have the information we need and will need to re-evaluate our
  solution.
* Open the notebook in JupyterHub; Repository is checked out at `/shared/QGreenland/.`.
  Notebook is at `content/exercises/data-scenarios/raster-needs-reprojection/solutions`.
* If anyone asks about interpolation done on zoomed-out interactive plot outputs, point
  out that `imshow` can take `interpolation='nearest'` argument to eliminate
  interpolation when not at 100% zoom.
:::


## TODO

<!-- TODO:
* Discussion about information loss from common transformations (reprojection,
  resampling, datatype conversion (raster<->vector))
* For each concept, talk about it at a high level, then demo what it looks like for
  raster and vector data.
* Tools / Techniques for raster/vector transformations
    * QGIS Processing Toolbox (brief mention, participants should be
      familiar with this from the [beginner tutorial
      series](https://www.youtube.com/watch?v=znKeiV3-Amo&amp;index=5)).
    * gdalwarp, ogr2ogr, ...
    * Python (rasterio, shapely, Xarray, pyresample, PyQGIS, ...)
    * _TODO: create notebook examples for various tools_
* Pitfalls
    * Some metadata in the source data may be carried over to the output,
      resulting in outdated metadata. For example, we have that issue with
      the bedmachine data produced for QGreenland. We can `gdalwarp` a
      bedmachine dataset to WGS84 and observe that the `mapping#` namespace
      continues to specify "polar stereographic" projection. On the plus side,
      citation and other metadata which we want to keep was also pulled over. This
      means you may need to do some manual metadata management when you apply
      transformations. `gdalwarp` has a `-nomd` flag to prevent metadata copying, but
      this can strip away useful metadata!
        * Integrate this pitfall into an example of transforming a raster; e.g. reformat
          a NetCDF and then show the carried-over metadata, especially any fields that
          are now wrong. Demo how to fix that?
-->
