---
title: "Data cross-compatibility"
index: 89
---


## ❤️  Make the data work together

Your team will work to make your data more analysis-compatible with the data from the
second team you worked with in the previous exercise. This means:

* Data should be in an open format with correct geospatial metadata.
    * Data should be in the same format if possible. For example, if both datasets are
      raster, make both GeoTiff.
* Data should be in the same projection
* Rasters should be co-registered (in the same projection and resolution and
  orientation)

Other transformations to consider for each dataset:

* Raster <-> Vector
* Subsetting/clipping (e.g., subset one layer to the other's extent)
* Buffer vector features
* Polygons -> points (find the centroid)
* Dissolve overlapping polygons
* Many more! Explore the processing toolbox tools!

Build this transformation process out in a Jupyter Notebook that guides the reader
through each step.

:::{.callout-note}
Remember that the choice of what transformations need to be done to a dataset to
make it 'compatible' with another is often driven by the planned analysis. If
you are having trouble coming up with ideas for how to transform data for this
exercise, think about how you might use the two datasets together to answer a
question.

For example, if you are trying to make a raster containing ice sheet velocity
data work together with a vector dataset containing points that represent the
location of study sites, you may want to ask what the average ice sheet velocity
is within 10km of each point. In order to do this, you would first
[buffer](https://docs.qgis.org/3.28/en/docs/gentle_gis_introduction/vector_spatial_analysis_buffers.html)
each point by 10km, and then use the [zonal
statistics](https://docs.qgis.org/3.28/en/docs/user_manual/processing_algs/qgis/rasteranalysis.html#zonal-statistics)
tool to get the average velocity within each resulting polygon.
:::


## 🗃️ Add the notebook to your team's GitHub repository

Using the GitHub interface, add this notebook to your team’s repository. Give it a
useful name!

## ⏱️ Finished early?

Please select one of the following data scenarios and develop a Jupyter Notebook to
resolve the scenario.

* [Vector reprojection](data-scenarios/vector-needs-reprojection/index.md)
* _TODO_
