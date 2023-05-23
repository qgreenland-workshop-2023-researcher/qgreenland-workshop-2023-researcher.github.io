---
title: "Data inspection with JupyterLab (30 minutes)"
index: 40
---

Learn about a dataset and its metadata.


## ⚙️ Get set up

Pick someone to "drive" with a screen share. Please rotate this responsibility!


## 🔍 Inspect some data

* Create a new Jupyter Notebook to inspect your group's chosen dataset.

::: {.callout-note}
Remember that you uploaded example data from your group's chosen dataset to
`/home/jovyan/shared-public/QGreenland-Researcher-Workshop/group-{your-group-number}` in
CryoCloud.
:::

* Use `ogrinfo`, `gdalinfo`, `ncdump -h`, `ncinfo`, `xarray`, or a tool of your
  choice in a Jupyter Notebook. Try some different methods. Find information
  like:
    * Projection
    * Extent (e.g. corner coordinates / edge values)
    * Grid shape
    * Number of features
<!-- alex ignore easy -->
* Include Markdown cells to tell a story. Explain what each operation is doing,
  and what your group learned from the results of each operation. Make it easy
  to come back to the notebook and find important attributes of your dataset.

::: {.callout-note}
Don't forget, you can put `%%bash`
["magic"](https://ipython.readthedocs.io/en/stable/interactive/magics.html#cell-magics)
at the top of a notebook cell to enable use of command-line utilities in that cell.
:::

::: {.callout-warning}
Don't lose track of this notebook. We will use it again in a future exercise.
Download it to your computer as a backup.
:::


## 📝 Example notebook

If you are looking for clarity or inspiration, please see our [example
notebook](./data-inspection-with-jupyterlab.ipynb) based on
a layer that is already in QGreenland.


## ⏱️ Finished early?

Try inspecting one or more of the [example datasets](/content/example-data/).
