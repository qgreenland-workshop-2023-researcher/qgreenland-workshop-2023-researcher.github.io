# Curriculum

Tentative date: May 22-25


## Ideas

* Include a break (or two) in each day's schedule. Break every hour? 90 minutes? How
  long to break?
* Resampling exercise?
* Consider having a "quiet" breakout room in Zoom for those who prefer to not talk while
  working.
* Consider adding some buffer time before and after break for things to run
  long. A longer break is better than a shorter break.
* Keep a timer/alarm for making sure we stay on target and don't miss the break.
* Encourage rotation of "driver" responsibility in breakout groups.
* Talk briefly about pair/group programming?
* Set expectation of group activities in application materials.
* Consider a sync service (e.g., `syncthing`) for sharing data between participants.
* Think about ways to encourage larger-group discussions following breakout rooms.


### Goal ideas for later

* Show data transformation provenance using Jupyter Notebooks
* Transparently share transformations and provenance using GitHub


## Schedule

### Day 1

#### Outcomes

* Get to know each other and form into groups.
* Select a dataset for your group to focus on over the course of the workshop.
* Gain familiarity with or review:
    * Open Science and data concepts/principles
    * Geospatial data concepts
* Create a repository on GitHub.


#### Activities

* **Discussion: Workshop overview (15 minutes)**

* **Breakout room activity: Team introductions (20 minutes)**

* **Discussion: Review of Open Science (and data) principles (25 minutes)**

* **Breakout room activity: FAIR/CARE discussion (30 minutes)**

* **Break (60 minutes)**

* **Discussion: Review of geospatial data concepts and terminology (10 minutes)**

* **Breakout room activity: Select and analyze a dataset (15 minutes)**

* **Discussion: Intro to GitHub repositories (25 minutes)**

* **Breakout room activity: Make a GitHub repository (40 minutes)**


### Day 2

#### Outcomes

* Gain familiarity with or review:
    * Geospatial data formats
    * Geospatial metadata concepts
* Create a Notebook in JupyterLab.
* Develop hands-on experience with manipulating data/metadata to improve dataset
  quality/usability.


#### Activities

* **Discussion: Day 2 activity overview (5 minutes)**
    * Discuss goals for Day 2.

* **Breakout room activity: Experiences with geospatial data (?? minutes)**
    * Discuss in groups: What are some particularly good/bad datasets you've been
        <!-- alex ignore easy -->
      exposed to and what attributes of that format make it easy/hard to work with? Keep
      it constructive; the author of this dataset may be in attendance, and we should
      always assume good intentions. **Data management is hard and standards are
      constantly improving.**
    * Report back to the larger group? Leading in to the following discussions.
    * How can we link this back to the chosen dataset? e.g. "How does the chosen dataset
      compare to your good/bad experiences/expectations with those formats?

* **Discussion: Geospatial data formats (25 minutes)**
    * _TODO: consider discussion about how data are often organized on disk (granularity)_
    * Problematic geospatial data formats: what is "wrong" with other common
      geospatial data formats (e.g. .xlsx, CSV/TSV, ...)
        * TODO: On Shapefiles; meet many quality criteria but also have some "deal
          breakers".
        * NOTE: CSV can be fine for _some_ non-geospatial data, but lacks standardized
          support for metadata (e.g. data types), and you will sometimes find CSV
          authors "wing it" and write metadata into CSV files in non-standard format,
          e.g. by adding lines to the end of the file. [W3
          suggests](https://www.w3.org/TR/tabular-data-model/#embedded-metadata) one
          method of embedding metadata into a CSV file, but it must be supported by the
          processing software. The advantage of CSV is that it's a "lowest common
          denominator" format that has broad support.
    * What makes a "good" geospatial data format? (e.g. self-documenting, FAIR, ...)
    * Examples of "good" geospatial data formats (e.g. GeoJSON, GeoPackage,
      GeoTIFF, NetCDF, ...)
        * TODO: What are some "good" self-describing formats for non-geospatial data?

* _TODO: How to break up this extended "lecture" section and make it less exhausting?_

* **Discussion: Review of key geospatial metadata concepts (20 minutes)**
    * Review of key geospatial metadata (projection, etc.). We assume participants are
      already familiar with this, but may have limited hands-on experience.
        * Even latitude/longitude coordinates need metadata (datum), particularly when
          the location data is of a high precision.
    * Common metadata standards, e.g., CF conventions for NetCDF data.
    * Provenance
    * Tools: `ogrinfo`/`gdalinfo`, `xarray`, `Panoply`

* _TODO: and/or breakout room activity here?_
    * What approaches to data introspection have you used / are you comfortable with?
    * What can you teach your teammates?
    * What can your teammates teach you?

* **Discussion: Intro to JupyterLab (20 minutes)**
    * Accessing the terminal
    * Accessing the desktop / QGIS
        * _TODO: Prior activities require use of QGIS; introduce this earlier? e.g.
          JupyterHub intro early in workshop, come back later to introduce Notebooks?_
    * Jupyter Notebooks as a tool for Literate Programming
        * Showing your work / tracking provenance.
    * Walk through running an example notebook and viewing its output in QGIS?
        * _TODO: Generate the example notebook._
        * Maybe programmatically generate a random distribution of points over an area
          in Greenland (e.g. use the extent of "Greenland coastlines 2017" layer as the
          x/y extents for random-number generation, then filter those random coordinates
          using the "Greenland coastlines 2017" layer).
        * Maybe filter the "Place names database" layer by:
            * Random sample
            * Maximum of a particular attribute

* **Break (60 minutes)**

* **Breakout room activity: Analyzing data with JupyterLab (30 minutes)**
    * Pick someone to "drive" with a screen share. Please rotate this responsibility!
    * Run the example notebook from the "Intro to JupyterLab" discussion.
    * Use your JupyterLab instance to inspect your group's chosen dataset. Try a few
      different methods!
        * Use `ogrinfo`, `gdalinfo`, `ncdump -h`, `ncinfo`, `xarray`, ??? in
          a Jupyter Notebook.
        * Include Markdown cells to tell a story: explain what each computation is
          doing, and what your group learned from the results of each computation.
        * Commit and push the notebook to GitHub.

* **Discussion on fixing "bad" data (?? minutes)**
    * ???
    * What can I do if my data still does not look right? (e.g. it's possible nobody
      living knows how to resolve the problem, metadata may be incorrectly documented
      and you may need help from the data producer, briefly mention techniques like
      georegistration, bias correction)
    * Tools: `ogr2ogr`, `gdal_translate`, `gdal_edit.py`

* **Walk through Data Scenario #1 and solutions (30 minutes)**

* **Breakout room activity: Fix some "bad" data (20 minutes)**
    * Does your chosen dataset have issues that need fixing? If not, explore Data
      Scenarios?

* **Homework: think about how you could perform an analysis with your chosen dataset**
    * Consider the other layers in QGreenland. How can you use them with your dataset to
      answer a question?
    * Share your ideas with your group in the GitHub Discussions for your repository.

### Day 3

#### Goals

* How to make data suitable for a specific analysis / problem?
* ???


#### Activities

* **Discussion: Explore geospatial data transformations (40 minutes)**
    * Concepts
        * Reprojection
            * _TODO: consider discussion about characteristics of common
              projections and why you might want to use one over another._
        * Resampling
        * Subsetting
        * Conversion (raster <-> vector)
        * _TODO: Consider discussion about information loss from common
          transformations (reprojection, resampling, datatype conversion
          (raster<->vector))_
    * Tools / Techniques
        * QGIS Processing Toolbox (brief mention, participants should be
          familiar with this from the [beginner tutorial
          series](https://www.youtube.com/watch?v=znKeiV3-Amo&amp;index=5)).
        * gdalwarp, ogr2ogr, ...
        * Python (rasterio, shapely, Xarray, pyresample, PyQGIS, ...)
        * _TODO: create notebook examples for various tools_

* **Breakout room activity: choose an analysis for your dataset (50 minutes)**
    * Choose an idea for an analysis involving your dataset.
    * Using a Jupyter Notebook:
        * Outline what steps you need to take to perform the analysis.
        * Estimate the time it would require to develop your analysis.
        * If there are barriers to performing your analysis, document what they
          are and how you could overcome them given the necessary resources
          (time, additional datasets, etc.).
    * Commit the notebook and push it to GitHub.

* **Break (60 minutes)**

_TODO: consider turning this into a video we post on the QGR YouTube and make homework
for day 1?_

* **Discussion: symbolizing geospatial data in QGIS (20-30 minutes)**
    * Colormaps (15 minutes)
        * `cmocean` as a strong default
            * How to add `cmocean` to QGIS (_TODO: add link to video_)
        * Common mistakes in choosing a colormap
            * Colorbrewer (a useful tool, but very specific use-case)
            * Jet / rainbow
        * Colormap analysis with `viscm`. _TODO: consider utilizing
          <https://github.com/nsidc/colormap-analysis>_
    * Representing vector data attributes (10 minutes)
        * Point markers
            <!-- alex ignore color -->
        * Color
        * Size
        * Labels
        * Scale dependent rendering
    * Accessibility related concerns?

* **Breakout room activity: Analyze your dataset (??)**
    * If possible, begin to perform your group's chosen analysis.
    * If your analysis is not possible, consider one of the following activities:
        * If your group's dataset is not "QGreenland-Friendly", make it so.
            * EPSG:3413
            * Use the QGreenland "Greenland-focused boundary" layer to subset the
              data (`Reference/QGreenland` boundaries in the QGreenland **Layers
              Panel**).
            * Make sure the data is GeoTIFF or GeoPackage.
        * Data analysis scenario
            * _TODO: consider additional data/analysis scenarios that groups can try if
              they have the time / do not have an analysis for their dataset._

* **End of workshop group report**
    * Tell us about what you learned
    * Provide a brief overview of your analysis / ideas for future analysis with
      the dataset you chose.
