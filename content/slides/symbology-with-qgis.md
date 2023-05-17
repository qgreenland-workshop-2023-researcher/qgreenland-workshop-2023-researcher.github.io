---
title: "Symbolizing geospatial data with QGIS"
subtitle: "QGreenland Researcher Workshop 2023"
index: 80
background-image: "https://live.staticflickr.com/65535/50268975211_f55d6b4e1c_k.jpg"
---

<!-- alex disable color colors -->

## Symbology is important

Symbology is [critical](https://www.kennethmoreland.com/color-advice/BadColorMaps.pdf)
to understanding data! Consider:

* Does your colormap look uniform across your values?
* Do your symbology choices unintentionally exclude any users, for example people with
  Color Vision Deficiency (CVD), a.k.a. colorblindness?
* What, aside from your data, will be in your visualization?
    * Basemap?
    * Other data elements?

::: {.notes}
* "Perceptual uniformity" is important for even users with perfect sight. The "Jet"
  colormap suffers
* Look for colormaps that are friendly to all forms of color deficiency
* Ensure contrast with your basemap: A light basemap requires a colormap with saturated
  (colorful) light values, and a dark basemap requires a colormap with saturated dark
  values.
* Ensure contrast with your other data elements. Red dots representing ice core
  locations won't show up well over temperature data displayed with the `heat` colormap.
:::


# Colormaps

::: {.notes}
Colormaps are the primary way we visualize raster data. Colormaps are also
useful in visualization of vector data in cases where we want to color vector
features according to an attribute (e.g., magnitude of earthquakes). More on
vector-specific symbology considerations in upcoming slides!
:::

## Perceptual uniformity {.smaller}

Jet and Rainbow are common, but "lie" about your data.

:::::: {.columns}
::: {.column width="34%"}
![Jet](/_media/cmap_jet.png)

![Turbo, a Google alternative to Jet](/_media/cmap_turbo.png)

![Viridis](/_media/cmap_viridis.png)
:::

::: {.column width="33%"}
![Jet's perceptual derivative shows high rate of change (red) some places, low rate of
change others (green)](/_media/perceptual_derivative_jet.png)
:::

::: {.column width="33%"}
![Viridis's perceptual derivative is consistent](/_media/perceptual_derivative_viridis.png)
:::
::::::

[viscm](https://github.com/matplotlib/viscm), software used for analyzing
colormap quality, was used to generate these images.


::: {.notes}
The colormaps on the left column are test images showing vertical lines that emphasize
the rate of change in the colormap. If some vertical lines stand out more than others,
that's a sign that the colormap contains false features (these are areas of high
perceptual derivative). If some vertical lines are invisible, that's a sign that the
colormap is hiding features of your data (these are areas of *low* perceptual
derivative).

Jet's lack of uniformity creates false features and hides real features in your data.

Turbo is slightly better, but not completely perceptually uniform.

Viridis is completely perceptually uniform and CVD-friendly.

Note that `viscm` is currently broken but we expect a fix soon!
:::


## Good places to start

* [cpt-city](http://soliton.vm.bytemark.co.uk/pub/cpt-city/): A website with lots of
  colormaps, some better than others.
* [SVG2ColoR](https://cbsuygulama.wordpress.com/2014/06/26/svg2color-qgis-color-ramp-plugin/):
  A plugin available from the official QGIS plugin repository for loading SVG
  styles from various sources (e.g., `cpt-city`).
* [Colorcet](https://colorcet.com/): All perceptually uniform,
  [some](https://peterkovesi.com/papers/ColourMapsForColourBlindIAMG2017.pdf)
  CVD-first.
* [ColorBrewer](https://colorbrewer2.org): All perceptually uniform, most 
  CVD-friendly.
* [cmocean](https://matplotlib.org/cmocean/): All perceptually uniform, some
  CVD-friendly.
* [CMasher](https://cmasher.readthedocs.io/user/introduction.html#colormap-overview):
  All perceptually uniform, some CVD-friendly.
* [matplotlib](https://matplotlib.org/stable/tutorials/colors/colormaps.html): Some
  perceptually uniform, some CVD-friendly.

::: {.notes}
Any of these sites are good places to start looking for the right colormap for your
visualization.

ColorBrewer colormaps are research-based, of high quality, largely CVD-safe, but are
built for a specific purpose. They have low saturation in their light colors and high
saturation in their dark colors, so they're not well-suited for use on a light basemap.

Reminder: CVD stands for Color Vision Deficiency!
:::


# Colormap set up in QGIS

Some high quality colormaps (e.g. Viridis, Cividis, Magma, Inferno, and Plasma), are
built in, others need to be installed.


## cpt-city and ColorBrewer in QGIS

*Settings > Style Manager > "+" button > Catalog: cpt-city*

_TODO: add a highlight around the correct "+" button!_
![Add a style](/_media/qgis_style_manager_plus.png)

::: {.notes}
Follow these same steps but select the ColorBrewer catalog if you prefer those
colormaps.
:::


---

*List styles by author, then select `cmocean`*

![Adding "deep" colormap](/_media/qgis_style_catalog_deep.png)


# Vector symbology

Colormaps are important for symbolizing vectors as well as rasters, but vector data have
some other unique concerns.


## Symbolizing shape

:::::: {.columns}
::: {.column width="50%"}
* Markers: color, shape, size
* Lines: color, thickness, pattern
* Fill: color, pattern
* Grouping: physical proximity
:::

::: {.column width="50%"}
![The Bird protected areas layers use hatch-filled polygons to indicate areas
that may have restricted access](/_media/bird_protected_areas_symbology.png)
:::
::::::

## Symbolizing attributes

:::::: {.columns}
::: {.column width="50%"}
* Labels: e.g. placenames
* Marker size: e.g. scalar value
* Color: e.g. scalar value
* Scale-dependent rendering
:::

::: {.column width="50%"}
![The Earthquakes layer uses size and color to indicate
magnitude.](/_media/earthquakes_symbology.png)
:::
::::::

<!-- alex enable color colors -->


## Exporting QGIS symbology

QGIS supports importing and exporting symbology choices as
[QML](https://docs.qgis.org/3.28/en/docs/user_manual/appendices/qgis_file_formats.html#qml-the-qgis-style-file-format)
files.

:::::: {.columns}
::: {.column width="50%"}
![Use the "Style" dropdown in the layer's Properties window](/_media/style_dropdown.png)
:::

::: {.column width="50%"}
![The "Save Layer Style" interface. Note that the "Load Style" interface looks
similar.](/_media/save_layer_style.png){width="65%"}
:::

::::::

:::{.notes}
Choose which categories you want to save to the style in the "Save Layer Style"
interface. If you only want to share symbology, uncheck everything
else. However, it is often helpful to share additional properties (e.g.,
`Labels`, which is a component of how data is visualized!) too!
:::


## Exporting QGIS layer definition


QGIS supports importing and exporting a layer's definition (symbology and
pointer to the data ) as
[QLR](https://docs.qgis.org/3.28/en/docs/user_manual/appendices/qgis_file_formats.html#qlr-the-qgis-layer-definition-file)
files.

Particularly useful for layers that you want to share that are accessed via the
internet (e.g., a WMS layer).

* To create a QLR file, right-click on a layer in the **Layers Panel**, then
select "Export > Save as Layer Definition File".

* To import a QLR file, use the **Layer** menu ("Layer > Add From Layer Definition File")

:::{.notes}
*This is a good slide to skip if we are short on time.*

Style files (QML) can also be exported this way ("Export > Save as QGIS Layer Style File").
:::
