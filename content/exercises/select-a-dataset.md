---
title: "Select and analyze a main dataset (15 minutes)"
index: 30
---

## 🤔 Select a dataset as a group

Use [these guidelines](/content/prerequisites/dataset-selection.md) to select a dataset
that your group will focus on going forward in this workshop.

:::{.callout-note}
You are not stuck with the dataset you choose! Your group can use a different
dataset at different times if it's more appropriate for a specific exercise.
:::

## Upload data

Upload data from your group's chosen dataset to JupyterHub. Note that some
datasets may have many data files (e.g., one for each day over a time
series). Choose one or two representative data files to upload in this case.

::: {.callout-warning}
If your chosen data is >2GB in size, please consider a different dataset or
contact an organizer for help! There is limited space available on our shared
CryoCloud.
:::

Use the JupyterHub File Browser interface to upload the data to
`/shared/public/QGreenland-Researcher-Workshop/group-{your-group-number}`.  For
example, if you group number is "one", your data should be uploaded to
`/shared/public/QGreenland-Researcher-Workshop/group-one/`.

![Upload your data to
`/shared/public/QGreenland-Researcher-Workshop/group-{your-group-number}` using the
"Upload Files" interface (indicated by red
square)](/_media/file-browser-data-upload.png)


## 🧭 Explore your dataset

Choose a note-taker and record the results of these steps in whatever way you feel
comfortable. We will come back to these notes later!

::: {.callout-warning}
Do not take notes in Zoom chat; they will disappear.
:::

* Try to open your data in QGIS alongside QGreenland (`Layer` > `Add Layer`). Is that
  possible?

::: {.callout-note}
Remember that the QGreenland data package is available at
`/home/jovian/qgis-data/QGreenland_v3.0.0alpha2/` in CryoCloud.
:::

* Identify key attributes of the data/metadata ("Unknown" is an expected answer)
    * Data type (raster, vector, etc.).
        * For rasters: is it categorical or continuous data? What are some of
          the categories that are present or what does the continuous variable
          measure?
        * For vectors: what geometry type(s) are included and what do they
          represent? What are some attributes?
    * File type (XLSX, CSV, Shapefile, NetCDF, etc)


## ⏱️ Finished early?

Time allowing, switch roles and explore one or more other datasets individuals
in the group have identified that were not chosen as the 'main' group
dataset. Alternatively, choose to explore one of the [example
datasets](/content/example-data/).
