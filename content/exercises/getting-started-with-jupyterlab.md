---
title: "Getting started with JupyterLab (30 minutes)"
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


## Explore JupyterLab

Complete the following tasks. While doing so, take time to explore and become
familiar with the JupyterLab interface.


## 🗺️ Open QGreenland with QGIS in JupyterLab

* Open a new tab in the JupyterLab GUI.
* Select "Desktop".
* On first launch, select "Use default config":

    ![Use default config](/_media/xfce_first_launch.png)

* Open QGIS from the desktop icon.
* Open QGreenland from `shared/QGreenland`.
* Explore QGreenland layers and turn on some layers.


## 🧪 Try out a Notebook

* Run the example notebook from the "Intro to JupyterLab" discussion.
    * Click "Run -> Run all cells"
    * When complete, you should see a map with QGreenland highlighted in red.
<!-- alex ignore color -->
* Change the color of the Greenland shape in the last cell of the notebook and
  re-render.
* Try changing other map parameters in the last cell of the notebook. Can you
  change the map's projection?
