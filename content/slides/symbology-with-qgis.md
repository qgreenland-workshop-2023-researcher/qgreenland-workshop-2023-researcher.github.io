---
title: "Symbolizing geospatial data with QGIS"
subtitle: "QGreenland Researcher Workshop 2023"
index: 80
background-image: "/_media/DMS_1842643_12758_20180418_18111267_clipped.jpg"
title-slide-attributes:
  data-background-image: "/_media/DMS_1842643_12758_20180418_18111267_clipped.jpg"
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
:::


## Resources

* [cpt-city](http://soliton.vm.bytemark.co.uk/pub/cpt-city/) is a website with lots of
  colormaps, some better than others.
* [viscm](https://github.com/matplotlib/viscm) is software used for analyzing colormap
  quality.


## Good places to start

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

![Add a style](/_media/qgis_style_manager_plus.png)

::: {.notes}
Follow these same steps but select the ColorBrewer catalog if you prefer those
colormaps.
:::


---

*List styles by author, then select `cmocean`*

![Adding "deep" colormap](/_media/qgis_style_catalog_deep.png)


## SVG colormaps in QGIS

Try the
[SVG2ColoR](https://cbsuygulama.wordpress.com/2014/06/26/svg2color-qgis-color-ramp-plugin/)
plugin available from the official QGIS plugin repository. All colormaps in cpt-city are
available for download as SVG.


# Vector symbology

Colormaps are important for symbolizing vectors as well as rasters, but vector data have
some other unique concerns.


## Symbolizing shape

* Markers: color, shape, size
* Lines: color, thickness, pattern
* Fill: color, pattern
* Grouping: physical proximity


## Symbolizing attributes

* Labels: e.g. placenames
* Marker size: e.g. scalar value
* Color: e.g. scalar value
* Scale-dependent rendering

<!-- alex enable color colors -->


## Exporting QGIS symbology

_TODO: Exporting styles as QML._

_TODO: Exporting all layer config as QLR._
