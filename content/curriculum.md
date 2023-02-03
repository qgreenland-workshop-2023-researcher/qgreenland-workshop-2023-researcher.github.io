# Curriculum

## Goals

* Build a shared familiarity with standard/open tools, formats, and practices
* Create a more collaborative/open environment for researchers
* ...?


## Ideas

* Include a break (or two) in each day's schedule. Break every hour? 90 minutes? How
  long to break?
* Resampling exercise?
* Consider having a "quiet" breakout room in Zoom for those who prefer to not talk while
  working


### Goal ideas for later

* Show data transformation provenance using Jupyter Notebooks
* Transparently share transformations and provenance using GitHub


## Schedule

### Day 1

#### Goals

* Get to know each other
* Get to know tools you will need for this workshop
* Learn basic usage of GitHub
* Learn basic usage of Jupyterlab
* Learn about "FAIR" data principles _(TODO: Others?)_


#### Activities

* **Workshop overview and team introductions (35 minutes)**
  * Discuss overall goals of the workshop and today (10 minutes)
  * Intro to GitHub Discussions (10 minutes)
  * Team introductions in breakout rooms (15 minutes)
  * TODO: Quirky icebreaker questions

* **Review/discussion of Open Science (and data) principles (25 minutes)**
  * Value of version control and doing work "in the open"
    * GitHub Discussions
    * TODO: Example Open Source research repositories?
  * [FAIR](https://www.go-fair.org/fair-principles/)
  * [CARE](https://www.gida-global.org/care)
  * TODO: FAIR/CARE data checker? Arctic Data Center maybe has something like this?

* **Breakout room discussion (30 minutes)**
  * How do FAIR/CARE relate to your research?
  * Post on GH Discussions?

* **Break (60 minutes)**

* **Into to GitHub: Repositories (25 minutes)**
  * Creating a GitHub repository and adding a `README.md` file
    * GitHub Flavored Markdown

* **Breakout room activity: Make a GitHub repository (20 minutes)**
  * Add a `README.md` file introducing team members
  * TODO: Who owns the repository? Create a dedicated organization?

* **Intro to JupyterHub (30 minutes)**
  * Jupyter Notebooks
  * Accessing the terminal
  * Accessing the desktop
  * Walk through running an example notebook and viewing its output in QGIS?

<!-- TODO: Pick a breakout room activity -->
* **Breakout room activity (15 minutes)**?
  * Pre-populate an example notebook that generates some basic data output.
    Walk through running the notebook then viewing the output in QGIS.

* **Breakout room activity: End of day reflection (15 minutes)**?
  * Post in GitHub discussions?


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


#### Activities

* **Review of foundational concepts of geospatial data and common terminology (30
  minutes)**
    * Vector data in QGIS
        * Types: point, line, polygon
        * Attributes
    * Raster data in QGIS
        * Types: continuous, categorical/discrete
        * Considerations
            * Interpolation: With categorical/discrete data, always use nearest
              neighbor to avoid "smudging" between regions.
    * Point-cloud and others

* **Break (60 minutes)**

* **Discussion on geospatial data quality (60 minutes)**
    * What makes a "good" geospatial data format? (e.g. self-documenting, FAIR, ...)
    * Examples of "good" geospatial data formats (e.g. GeoJSON, GeoPackage, GeoTIFF,
    NetCDF, ...)
        * TODO: On Shapefiles; meet many quality criteria but also have some "deal
          breakers".
        * TODO: What are some "good" self-describing formats for non-geospatial data?
        * NOTE: CSV can be fine for _some_ non-geospatial data, but lacks standardized
          support for metadata (e.g. data types), and you will sometimes find CSV
          authors "wing it" and write metadata into CSV files in non-standard format,
          e.g. by adding lines to the end of the file. [W3
          suggests](https://www.w3.org/TR/tabular-data-model/#embedded-metadata) one
          method of embedding metadata into a CSV file, but it must be supported by the
          processing software. The advantage of CSV is that it's a "lowest common
          denominator" format that has broad support.
    * What is "wrong" with other common geospatial data formats (e.g. .xlsx, CSV/TSV, ...)
      resample, ...?

* **Walk through Data Scenario #1 and solutions (30 minutes)**


### Day 3

#### Goals

* Develop hands-on experience with manipulating data/metadata to improve dataset quality
* ???


#### Activities

* **Explore common geospatial data operations (60 minutes)**
    * Explore some QGIS Toolbox tools, e.g. reprojection, reformat, ...?
    * Explore GDAL and Python tools

* **Commit a script to GitHub (15 minutes)**

* **Break (60 minutes)**

* **Group exercises: Data Scenarios 2-4 (90 minutes)**
