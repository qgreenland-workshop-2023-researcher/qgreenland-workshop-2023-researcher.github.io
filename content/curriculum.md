# Curriculum

## Goals

* Build a shared familiarity with standard/open tools, formats, and practices
* Create a more collaborative/open environment for researchers
* ...?


## Ideas

* Include a break (or two) in each day's schedule. Break every hour? 90 minutes? How
  long to break?
* Resampling exercise?


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

* **Introductions (30 minutes)**

* **Review/discussion on "FAIR", "CARE", ...? data principles (30 minutes)**
  * [FAIR](https://www.go-fair.org/fair-principles/)
  * [CARE](https://www.gida-global.org/care)

* **Intro to GitHub: Discussions (30 minutes)**

* **Break (60 minutes)**

* **Into to GitHub: Repositories (45 minutes)**
  * Creating a GitHub repository and adding a `README.md` file
    * GitHub Flavored Markdown

* **Intro to JupyterHub (45 minutes)**
  * Jupyter Notebooks
  * Accessing the terminal
  * Accessing the desktop


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
