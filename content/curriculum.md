# Curriculum

## Goals

* Build a shared familiarity with standard/open tools, formats, and practices
* Create a more collaborative/open environment for researchers
* ...?


## Ideas

* Include a break (or two) in each day's schedule. Break every 60m? 90m? How long to
  break?


## Schedule

### Day 1

#### Goals

* Get to know each other
* Get to know tools you'll need for this workshop
* Learn what determines the quality of a dataset
    * What are common data formats?
    * What are common metadata standards?
    * What are some common practices that lead to problems interacting with data?
* Learn how to fix "bad" data
    * What can I do if my data still doesn't look right? (e.g. it's possible nobody living
    knows how to resolve the problem, metadata may be incorrectly documented and you may
    need help from the data producer, briefly mention techniques like georegistration,
    bias correction)


#### Activities

* **Introductions (45m)**

* **Intro to tools we'll be using (15m)**
    * GitHub Discussions: Asynchronous group communication during and after the workshop.
    * Computational tooling: What computing environment will we use and how will attendees
    get set up?

* **Review of foundational concepts of geospatial data and common terminology (30m)**
    * Vector data
        * Types: point, line, polygon
        * Attributes
    * Raster data
        * Types: continuous, categorical
    * Point-cloud and others

* **Break (60m)**

* **Discussion on geospatial data quality (30m)**
    * What makes a "good" geospatial data format? (e.g. self-documenting, FAIR, ...)
    * Examples of "good" geospatial data formats (e.g. GeoJSON, GeoPackage, GeoTIFF,
    NetCDF, ...)
        * TODO: On Shapefiles; meet many quality criteria but also have some "dealbreakers".
        * TODO: What are some "good" self-describing formats for non-geospatial data?
        * NOTE: CSV can be fine for _some_ non-geospatial data, but lacks standardized
      support for metadata (e.g. data types), and you'll sometimes find CSV authors
      "wing it" and write metadata into CSV files in non-standard format, e.g. by adding
      lines to the end of the file. [W3
      suggests](https://www.w3.org/TR/tabular-data-model/#embedded-metadata) one method
      of embedding metadata into a CSV file, but it must be supported by the processing
      software. The advantage of CSV is that it's a "lowest common denominator" format
      that has broad support.
    * What is "wrong" with other common geospatial data formats (e.g. .xlsx, CSV/TSV, ...)

* **Walkthrough Data Scenario #1 and solutions (60m)**


### Day 2

#### Goals

* Develop hands-on experience with manipulating data/metadata to improve dataset quality
* ???


#### Activities

* **Group exercises: Data Scenarios 2-4 (90m)**

* **_TODO: Some activity to fill time if exercises done early_**

* **Break (60m)**

* **???**


### Day 3

#### Goals

* ???


#### Activities

* **???**
