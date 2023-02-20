# Curriculum

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

* **Breakout room activity: Experiences with geospatial data (?? minutes)**

* **Discussion: Geospatial data formats (25 minutes)**

* _TODO: How to break up this extended "lecture" section and make it less exhausting?_

* **Discussion: Review of key geospatial metadata concepts (20 minutes)**

* _TODO: and/or breakout room activity here?_
    * What approaches to data introspection have you used / are you comfortable with?
    * What can you teach your teammates?
    * What can your teammates teach you?

* **Discussion: Intro to JupyterLab (20 minutes)**

* **Break (60 minutes)**

* **Breakout room activity: Analyzing data with JupyterLab (30 minutes)**

* **Discussion on fixing "bad" data (?? minutes)**

* **Walk through Data Scenario #1 and solutions (30 minutes)**

* **Breakout room activity: Fix some "bad" data (20 minutes)**

* **Homework: think about how you could perform an analysis with your chosen dataset**

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
