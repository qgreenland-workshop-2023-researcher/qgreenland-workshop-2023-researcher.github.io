---
title: "Data inspection with JupyterLab (30 minutes)"
---

Learn about a dataset and its metadata.


## ⚙️ Get set up

Pick someone to "drive" with a screen share. Please rotate this responsibility!


## 🔍 Inspect some data

* Create a new Jupyter Notebook to inspect your group's chosen dataset.
* Use `ogrinfo`, `gdalinfo`, `ncdump -h`, `ncinfo`, `xarray`, or a tool of your
  choice in a Jupyter Notebook. Try some different methods. Find information
  like:
    * Projection
    * Extent (e.g. corner coordinates / edge values)
    * Grid shape
    * Number of features
* Include Markdown cells to tell a story. Explain what each operation is doing,
  and what your group learned from the results of each operation. Make it easy
  to come back to the notebook and find important attributes of your dataset.

::: {.callout-warning}
Don't lose track of this notebook. We will use it again in a future exercise.
Download it to your computer as a backup.
:::


## 📝 Example notebook

If you are looking for clarity or inspiration, please see our [example
notebook](./data-inspection-with-jupyterlab.ipynb) based on
a layer that is already in QGreenland.
