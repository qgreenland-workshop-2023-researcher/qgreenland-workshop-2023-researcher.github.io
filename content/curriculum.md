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


### Goal ideas for later

* Show data transformation provenance using Jupyter Notebooks
* Transparently share transformations and provenance using GitHub


## Schedule

### Day 1

#### Goals

* Get to know each other and form into groups.
* Select a dataset for your group to focus on over the course of the workshop.
* Get to know tools you will need for this workshop
* Learn basic usage of GitHub
* Learn basic usage of JupyterLab
* Learn about "FAIR" data principles _(TODO: Others?)_


#### Activities

* **Workshop overview (15 minutes)**
    * Discuss overall goals of the workshop and today (10 minutes)
    * Intro to GitHub Discussions (5 minutes)

* **Team introductions in breakout rooms (20 minutes)**
    * Briefly describe the dataset you chose and why.
    * TODO: Quirky icebreaker questions

* **Review/discussion of Open Science (and data) principles (25 minutes)**
    * Value of version control and doing work "in the open"
        * GitHub Discussions
        * TODO: Example Open Source research repositories?
    * [FAIR](https://www.go-fair.org/fair-principles/)
    * [FAIR4RS](https://www.rd-alliance.org/groups/fair-research-software-fair4rs-wg)
    * [CARE](https://www.gida-global.org/care)
    * STREAM?
    * Open Data Charter
    * TODO: FAIR/CARE data checker? _TODO: Arctic Data Center maybe has something like this. Ask?_

* **Breakout room discussion (30 minutes)**
    * How do FAIR/CARE relate to your research?
    * Discuss how one or more of the datasets your group members has chosen
      relate/conform to FAIR/CARE.
    * Post on GH Discussions?

* **Break (60 minutes)**

* **Brief review of foundational concepts of geospatial data and common terminology (10
  minutes)**
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

* **Breakout room discussion (15 minutes)**
    * Select a dataset that your group will work on. _TODO: Consider guidelines
      for selecting an interesting dataset_.
    * Try to open your data in QGIS. Is that possible?
    * Identify key attributes of the data/metadata ("Unknown" is a valid answer)
        * Data type (raster, vector, etc.)
        * File type (xlsx, csv, shapefile, netcdf, etc)
        * Projection & corner coords (for raster data)
    * For now, choose a notetaker and record this information in whatever way
      you feel comfortable. We will come back to these notes later!

* **Into to GitHub: Repositories (25 minutes)**
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

#### Goals

* Learn what determines the quality of a dataset
    * What are common data formats?
    * What are common metadata standards?
    * What are some common practices that lead to problems interacting with data?
* Learn how to fix "bad" data
    * What can I do if my data still does not look right? (e.g. it's possible nobody
      living knows how to resolve the problem, metadata may be incorrectly documented
      and you may need help from the data producer, briefly mention techniques like
      georegistration, bias correction)
* Develop hands-on experience with manipulating data/metadata to improve dataset
  quality/usability.


#### Activities

* **Discussion on geospatial data formats (25 minutes)**
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

* _TODO: breakout room activity here?_

* **Review of key geospatial metadata concepts (20 minutes)**
    * Review of key geospatial metadata (projection, etc.). We assume participants are
      already familiar with this, but may have limited hands-on experience.
      * Even lat/lon coordinates need metadata (datum), particularly when the
        location data is of a high precision.
    * Common metadata standards, e.g., CF conventions for NetCDF data.
    * Provenance
    * `ogrinfo` and `gdalinfo`

* _TODO: breakout room activity here? Maybe have participants use `ogrinfo` or
  `gdalinfo` to inspect their datasets? Some datasets may not work with these commands._

* **Break (60 minutes)**

* **Intro to JupyterHub (30 minutes)**
    * Tool for showing your work / tracking provenance. 
    * Jupyter Notebooks
    * Accessing the terminal
    * Accessing the desktop
    * Walk through running an example notebook and viewing its output in QGIS?

* **Breakout room activity (20 minutes)**?
    * Pre-populate an example notebook that generates some basic data output.
      Walk through running the notebook then viewing the output in QGIS. Maybe
      generate a random distribution of poitns over an area in greenland that
      might represent data colleciton points.

* **Walk through Data Scenario #1 and solutions (30 minutes)**

* **Breakout room activity: work on chosen datasets to reformat / add metadata if necessary**?
    * _TODO: What would groups do if their dataset doesn't need any changes?_

### Day 3

#### Goals

* How to make data suitable for a specific analysis / problem?
* ???


#### Activities

* **Explore common geospatial data operations (60 minutes)**
    * Explore some QGIS Toolbox tools, e.g. reprojection, reformat, resample, ...?
      * _TODO: consider discussion about characteristics of common projections
        and why you might want to use one over another_
      * _TODO: Consider discussion about information loss from common
        transformations (reprojection, resampling, datatype conversion
        (raster<->vector))_
    * Explore GDAL and Python tools
    * _TODO: consider discussing sybolizing geospatial data (e.g., colormaps)_

* **Commit a script to GitHub (15 minutes)**

* **Break (60 minutes)**

* **Group exercises: Data Scenarios 2-4 (90 minutes)**
