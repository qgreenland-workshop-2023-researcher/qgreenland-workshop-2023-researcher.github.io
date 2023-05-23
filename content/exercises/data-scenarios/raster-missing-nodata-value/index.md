---
title: "Data Scenario: Raster missing NoData value"
categories: ["Data issue"]
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

<!-- alex ignore black -->
You download the dataset `bambgrl_dem_5km_corrected.tif`
[@bamber_2001_greenland_dem] and open it in QGIS. You observe that ocean values
all appear black. You use the **Identify tool** to verify all the black values
are the same: `1.1`.

![`bambgrl_dem_5km_corrected.tif` displayed in
QGreenland](/_media/qgreenland_missing_nodata_value.png)

At this point, you are not sure what this represents, so you consult the [user
guide](https://nsidc.org/sites/default/files/nsidc-0092-v001-userguide.pdf) to find this
important phrase at the top of page 4:

>DEM values of -0.1 m represent ocean

Since you don't need this dataset to represent ocean locations (and it covers up your
basemap), you decide you would like to encode this ocean value in the metadata as a NoData
value.


## Validation

The dataset should not show ocean values when initially opened in QGIS.

::: {.callout-note}
This problem can be solved with symbology, but that is not what we are aiming
for here. We want a file with the ocean pixels encoded internally as NoData
values so we can share it with others and they will not have to deal with this
issue.
:::

::: {.callout-warning}
The floating point `nodata` value used for this dataset illustrates how floating point
values can be problematic for encoding flag values. Some tools will identify the nodata
cells as `-0.1`, a truncated representation, and others will identify the value as
`-0.10000000149011612`. Consider `NaN` instead!
:::

![Solution displayed in QGreenland](/_media/qgreenland_dem_with_nodata.png)
