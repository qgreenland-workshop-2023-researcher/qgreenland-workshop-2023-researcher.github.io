# Curriculum


## Goals

* Build a shared familiarity with standard/open tools, formats, and practices.
* Create a more collaborative/open environment for researchers.
* Prepare new datasets for use in the QGreenland QGIS data environment.
* ...?


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
    * Discuss overall goals of the workshop and today (10 minutes)
    * Intro to GitHub Discussions (5 minutes)

* **Breakout room activity: Team introductions (20 minutes)**
    * Briefly describe the dataset you chose and why.
    * TODO: Quirky icebreaker questions

* **Discussion: Review of Open Science (and data) principles (25 minutes)**
    * Value of version control and doing work "in the open"
        * GitHub Discussions
        * TODO: Example Open Source research repositories?
    * [FAIR](https://www.go-fair.org/fair-principles/)
    * [FAIR4RS](https://www.rd-alliance.org/groups/fair-research-software-fair4rs-wg)
    * [CARE](https://www.gida-global.org/care)
    * STREAM?
    * Open Data Charter
    * TODO: FAIR/CARE data checker? _TODO: Arctic Data Center maybe has something like this. Ask?_

* **Breakout room activity: FAIR/CARE discussion (30 minutes)**
    * How do FAIR/CARE relate to your research?
    * Discuss how one or more of the datasets your group members has chosen
      relate/conform to FAIR/CARE.
    * Post on GH Discussions?

* **Break (60 minutes)**

* **Discussion: Review of geospatial data foundational concepts and common terminology
  (10 minutes)**
    * Vector data in QGIS
        * Types: point, line, polygon
        * Attributes
    * Raster data in QGIS
        * Types: continuous, categorical/discrete
        * Considerations
            * Interpolation: With categorical/discrete data, always use nearest
              neighbor to avoid "smudging" between regions. _TODO: consider
              moving this discussion to day 3? This is an operation that is more
              aligned with the goal of preparing data for a specific use case_.
    * Point-cloud and others

* **Breakout room activity: Select and analyze a dataset (15 minutes)**
    * Select a dataset that your group will work on. _TODO: Consider guidelines
      for selecting an interesting dataset_.
    * Try to open your data in QGIS. Is that possible?
    * Identify key attributes of the data/metadata ("Unknown" is an expected answer)
        * Data type (raster, vector, etc.)
        * File type (xlsx, csv, shapefile, netcdf, etc)
        * Projection
        * Extent (e.g. corner coords / edge values)
    * Choose a notetaker and record this information in whatever way you feel
      comfortable. We will come back to these notes later! NOTE: Do not take notes in
      Zoom chat, they will disappear.

* **Discussion: Intro to GitHub repositories (25 minutes)**
    * FAIR can apply to all of the work that you are doing. Now that we have
      some knowledge about the data that we want to keep track of and share with
      others, lets utilize GitHub as the mechanism to translate that knowledge
      to documentation.
    * Demonstrate creating a git repo in the GitHub interface with a `README.md`
      file with the type of knowledge we want groups to record about their
      dataset. Use an existing QGreenland data layer as an example.
        * GitHub Flavored Markdown (we don't expect participants to read through all of this, just a reference).
            * Basics: https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax
            * Full spec: https://github.github.com/gfm/

* **Breakout room activity: Make a GitHub repository (40 minutes)**
    * Create repository. _TODO: what should the repo be named? Consider
      mentioning the difficulties around naming. Guidelines?_
    * Add a `README.md` file introducing team members and identifying the
      dataset your group has chosen.
        * list of team members
        * Mimic the repo created in the previous activity, create a section for
          the metadata and data.
    * _TODO: Create a dedicated organization._
    * _TODO: think more about what exactly we want people to do in the last 20 min_
    * _TODO: should there be a second deliverable here? A git commit? A github
      discussion? Some kind of reflection on the day?_


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
      exposed to and what attributes of that format make it easy/hard to work with? Keep
      it constructive; the author of this dataset may be in attendance, and we should
      always assume good intentions. _Data management is hard and standards are
      constantly improving._
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
        * Even lat/lon coordinates need metadata (datum), particularly when the location
          data is of a high precision.
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

### Day 3

#### Goals

* How to make data suitable for a specific analysis / problem?
* ???


#### Activities

* **Discussion: Explore geospatial data transformations (40 minutes)**
    * Concepts
        * Reprojection
            * _TODO: consider discussion about characteristics of common
              projections and why you might want to use one over another_
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
        * Python (rasterio, shapely, xarray, pyresample, PyQGIS, ...)
        
* **Breakout room activity: Data Scenarios ?? (90 minutes)**
    * If your group's dataset is not "QGreenland-Friendly", make it so.
        * EPSG:3413
        * Use the Greenland focused-boundary to subset the data.
        * Make sure the data is GeoTiff or GeoPackage.
    * _TODO: make data scenarios that are data based, not just metadata (exercise the concepts above)_

* **Break (60 minutes)**

* **Discussion: symbolizing geospatial data**
    * Representing vector data attributes
      * Point markers
      * Color
      * Size
      * Labels
      * Scale dependent rendering
    * Colormap analysis with `viscm`. _TODO: consider utilizing
      https://github.com/nsidc/colormap-analysis_
    * Accessibility related concerns?

* **Breakout room activity: Visualize your dataset in an interesting way**
