---
title: "Getting started with JupyterLab"
index: 20
---

::: {.callout-note}
This is an individual exercise. Remaining exercises will be done as a team.
:::

Explore JupyterLab features.


## ⚙️ Get set up

* Log in to the [CryoCloud JupyterHub](https://hub.cryointhecloud.com) with your
  GitHub username
* Select the Python Image with a 4GB node share

![Jupyterhub server selection](/_media/jupyterhub_server_selection.png){width="70%"}

* Run the setup script
  * _TODO: finish setting this point up_


## Explore JupyterLab

Complete the following tasks. While doing so, take time to explore and become
familiar with the JupyterLab interface.


## 🗺️ Open QGreenland with QGIS in JupyterLab

* Open a new tab in the JupyterLab GUI.
* Select "Desktop".
* On first launch, select "Use default config":

    ![Use default config](/_media/xfce_first_launch.png)

* Open QGIS from the desktop icon.
* Open QGreenland from `/home/jovian/qgis-data/QGreenland_v3.0.0alpha2/`.
* Explore QGreenland layers and turn on some layers.

:::{.callout-note}
Consider saving your own version of the project file (e.g.,
`/home/jovian/qgis-data/QGreenland_v3.0.0alpha2/qgreenland_personal.qgs`) so
that you can make and save changes to e.g., layer order and symbology without
overwriting the original project file.
:::


## 🧪 Try out a Notebook

* Run the example notebook from the "Intro to JupyterLab" discussion.
    * Click "Run -> Run all cells"
    * When complete, you should see a map with QGreenland highlighted in red.
<!-- alex ignore color -->
* Change the color of the Greenland shape in the last cell of the notebook and
  re-render.
* Try changing other map parameters in the last cell of the notebook. Can you
  change the map's projection?
