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


A colleague has sent you a CSV file containing the locations of potential field
study sites in Greenland. The CSV provides coordinates in latitude and longitude
(EPSG:4326 / WGS84): 

:::: {.code-with-filename .sourceCode}
::: {.code-with-filename-file}
<pre>datafile.csv</pre>
:::
<pre class="sourceCode default">
{{< include datafile.csv >}}
</pre>
::::

However, your site suitability analysis code expects coordinates in NSIDC Polar
Stereographic North (EPSG:3413). Furthermore, your code expects that the potential sites
be provided as a GeoPackage (`.gpkg`) file.


Reproject `datafile.csv` from `EPSG:4326` to `EPSG:3413` and convert the format
to GeoPackage.


# Validation

The resulting solution file should be in `EPSG:3413`. Use a tool to confirm this!

E.g.,

```python
$ python
>>> import fiona
>>> ds = fiona.open('solutions/datafile_3413.gpkg')
>>> ds.crs
CRS.from_epsg(3413)
```

`ogrinfo` is another appropriate tool, but is much more verbose in its output.

After successful reprojection, the data looks good alongside QGreenland:

![Reprojected data file](/_media/qgreenland_vector_reprojected.png)
