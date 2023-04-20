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

You want to re-use the QGreenland analysis area (represented by the `Greenland-focused
boundary` layer in QGreenland) for a global analysis. Reproject that layer to `EPSG:4326`.


## Validation

The output file should accurately represent the shape of the QGreenland boundary in
`EPSG:4326`. Check to make sure it doesn't intersect with Greenland!

![The original boundary in yellow; incorrectly reprojected boundary in red](/_media/qgreenland_boundary_4326_raster_vector.png)
