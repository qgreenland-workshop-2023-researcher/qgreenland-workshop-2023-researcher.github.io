---
title: "Intro to JupyterLab"
subtitle: "QGreenland Researcher Workshop 2023"
background-image: "/_media/DMS_1842643_12758_20180418_18111267_clipped.jpg"
title-slide-attributes:
  data-background-image: "/_media/DMS_1842643_12758_20180418_18111267_clipped.jpg"
---

# Note

We are going to demo a number of features around the use of JupyterLab in the
following slides. Please plan to watch as we explain various features before
trying them yourself in an [exercise](/content/exercises/getting-started-with-jupyterlab.html)
after the presentation.

## JupyterHub ![](/_media/jupyterhub_icon.png){width="5%" style="vertical-align:middle"}

CryoCloud: your personal JupyterLab in the cloud

* JupyterHub: <https://hub.cryointhecloud.com>
* Website: <https://book.cryointhecloud.com>

![Cryocloud logo](/_media/cryocloud_logo.png){width="25%"}


::: {.notes}
JupyterHub is a system for creating many JupyterLabs, e.g. for classrooms
:::

## JupyterHub ![](/_media/jupyterhub_icon.png){width="5%" style="vertical-align:middle"}

Log in to CryoCloud JupyterHub with your GitHub username

* Important: select a 4GB server option
* Your JupyterLab workspace is dedicated, _not_ shared!

![Jupyterhub server selection](/_media/jupyterhub_server_selection.png){width="70%"}

:::{.notes}
We encourage users to start with the 4GB RAM option to start. If individuals run
into memory issues working with a dataset during the workshop, trying the 8GB
option is reasonable.

Although each user has their own dedicated workspace and file system, compute
resources are not completely isolated. For example, selecting a 4GB RAM server
size results in a guaranteed allocation of 4GB but if more memory is free on the
node a user may be able to utilize more than 4GB.

* Other attendees can't see your files (except those in `shared/` dir)
* No scheduler like on a supercomputer
    * Your computations won't interfere with anyone else's
:::

#

![JupyterLab](/_media/jupyterlab.png)

:::{.notes}
Show what the CryoCloud JupyterLab looks like after signing in and selecting a
server.
:::


# 

![JupyterLab - memory/RAM usage](/_media/jupyterlab_memory.png)

:::{.notes}
Highlight where to monitor memory usage. If a dataset is particularly large
and/or an operation on the data is getting stuck, check memory usage.

If individuals run into memory issues working with a dataset during the
workshop, trying the 8GB option is reasonable.
:::


# What can I do in my JupyterLab?

💻 Almost anything you can do on your personal computer!

👪 JupyterLab is a human-friendly interface to computation resources.

![JupyterLab logo](/_media/jupyterlab_about_logo.png)

:::{.notes}
The JupyterLab logo is a screenshot from JupyterLab's "Help -> About JupyterLab"
pop-up in CryoCloud.
:::

#

![JupyterLab left side panel](/_media/jupyterlab_left_side_panel.png)

:::{.notes}
We'll talk about the left side panel first.
:::


## File browser ![](/_media/jupyterlab_file_browser_icon.png){width="3%" style="vertical-align:middle"}
:::::: {.columns}

::: {.column}
* Drag & drop from your desktop
* Open many types of files and get a useful display
    * CSV will display as table
    * GeoJSON will display on a map
    * Images will open with an image viewer
:::

::: {.column}
![JupyterLab file browser](/_media/jupyter_lab_file_browser.png)
:::

::::::

## Running terminals and kernels ![](/_media/jupyterlab_running_terminals_kernels_icon.png){width="3%" style="vertical-align:middle"}
:::::: {.columns}

::: {.column}
* Lists currently running Terminals and Kernels.

* If one of these apps gets 'stuck', you may need to shut it down and
  try again

* If you accidentally close a terminal or notebook tab, you can re-access it by
  clicking on its entry here.
:::

::: {.column}
![JupyterLab Running Terminals and Kernels](/_media/jupyterlab_running_terminals_kernels.png)
:::

::::::

:::{.notes}
We will not be covering the usage of the final three side panel views.
:::

#

![JupyterLab Launcher](/_media/jupyterlab_launcher.png)

:::{.notes}
Applications can be launched from the Launcher, opening a new tab/window for
that application.

To open a new Launcher, click the "+" tab, `File > New Launcher`, or the Blue
`+` button in the file browser left side panel.
:::

## Terminal ![](/_media/jupyterlab_terminal_icon.png){width=5% style="vertical-align:middle"}

* `conda install <package>`
* `mamba install <package>`
* Common GDAL/OGR utilities: `gdalinfo`, `ogrinfo`, etc.

![JupyterLab terminal](/_media/jupyterlab_terminal.png)

::: {.notes}
Conda and Mamba are already installed, and a `notebook` environment is pre-created. Use
`conda`/`mamba` commands to install Python dependencies into the `notebook` environment.
:::


## Desktop ![](/_media/jupyterlab_desktop_icon.png){width=5% style="vertical-align:middle"}

![Desktop](/_media/jupyterlab_desktop.png)

:::{.notes}
The desktop opens in a new browser tab, not a new tab in JupyterLab.
:::

## Desktop ![](/_media/jupyterlab_desktop_icon.png){width=5% style="vertical-align:middle"}

On first launch, select "Use default config"

![Use default config](/_media/xfce_first_launch.png)


## Desktop: file browser

The "Home" icon on the desktop shows the same files as JupyterLab File Browser.

![Desktop file browser](/_media/jupyterlab_desktop_file_browser.png)

::: {.notes}
There's also a terminal emulator and other utilities often found in a desktop
GUI environment.
:::


## Desktop: QGIS and QGreenland

Can open QGreenland!

![Desktop with QGIS and QGreenland](/_media/jupyterlab_desktop_qgreenland.png)

::: {.notes}
Opening QGreenland should take ~2 minutes.

Do not use the logout function within the desktop, as this may make it difficult to get
back into your desktop.
:::


## Desktop: logging out
::: {.callout-warning}
Do not use "Logout" from the desktop environment!
:::

To close the desktop, please close the window/tab that the desktop environment is open in.

:::{.notes}
_TODO: add an image showing a "no" symbol over the logout menu?_
:::


## Jupyter Notebooks

:::::: {.columns}
::: {.column}
* A tool for [Literate Programming](https://en.wikipedia.org/wiki/Literate_programming)
    * Showing your work
    * Tracking provenance
    * Telling a story
    
* See also:
    * Quarto
    * JupyterBook
:::

::: {.column}
![Jupyter Notebook](/_media/jupyterlab_notebook.png)
:::
::::::

:::{.notes}
At this point, do a live demo of the `demo.ipynb` notebook.

When demoing the notebook, ensure that we narrate double-clicking markdown cells
to show the source of it. And also how to expand/collapse cells.

Also be sure to demonstrate how to create a new cell, change it's type
(Markdown, Code, ...), and move cells around.

<!-- alex ignore execution -->
Note that execution order matters.
:::


# Log Out when done!

::: {.callout-important}
_At the end of each day, click `File > Log Out`_
:::

![Log Out](/_media/jupyterlab_log_out.png){width=40%}

::: {.notes}
Log out at the end of each day to save on cloud costs.

Any files you've created will remain next time you log in.
:::
