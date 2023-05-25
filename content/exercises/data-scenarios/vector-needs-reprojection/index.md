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

:::{.callout-note}
You can find this scenario in
`/home/jovyan/qgis-data/workshop-materials/content/exercises/data-scenarios/vector-needs-reprojection/`
:::

You want to re-use the QGreenland analysis area (represented by the `Greenland-focused
boundary` layer in QGreenland) for a global analysis. Reproject that layer to `EPSG:4326`.


## Validation

The output file should accurately represent the shape of the QGreenland boundary in
`EPSG:4326`. Check to make sure it doesn't intersect with Greenland!

![The correctly reprojected boundary in yellow; incorrectly reprojected boundary in red](/_media/qgreenland_boundary_4326_raster_vector.png)

Intersection occurs in the incorrect reprojection because the original 4 points that
made up the boundary were reprojected and connected by straight edges. In reality, the
original edges would be curved in this projection. With more vertices, the curve can be
approximated.
