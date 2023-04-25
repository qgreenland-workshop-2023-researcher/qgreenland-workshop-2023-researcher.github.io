# TODO

## Content

### Major incomplete sections

* Slides & exercise: Geospatial transformation
    * Build out final scenario in slides, consider removing
    * Figure out what parts of the exercise to keep or move
* Slides: QGIS symbology
* Exercise: QGIS symbology


### Goal ideas

* Show data transformation provenance using Jupyter Notebooks
* Transparently share transformations and provenance using GitHub


### Slides / presenting

* Does our conda environment need the whole `jupyter` metapackage, or just one piece?
* Can we pre-record presentations? More control over timing, more end-user control over
  the presentation, e.g. skipping parts they already understand or rewinding parts when
  they require review.
* Limit live presentations to brief overviews of topics, providing supporting materials,
  e.g. pre-recorded topic presentations. Focus on solving problems as a group and
  directly supporting groups.
* Diversify background imagery; currently have one cropped IceBridge DMS image, but
  could also use images from [NSIDC's Flickr
  account](https://www.flickr.com/photos/nsidc/albums/72157715526805678)
* Should we have a module about integrating GitHub with Zenodo to create DOIs?
* Consider discussion about how data are often organized on disk (granularity)


### Exercises

* Consider migrating solutions from shell scripts to notebooks
* Consider data scenario: Reproject a vector rectangle with 4 points from 3413 <-> 4326.
  You'd expect a curved shape, but you get a straight-sided shape. Discuss the need to
  subdivide.
* Resampling exercise?


### Workshop materials

* ~~Rethink the "fixing metadata issues" exercises/scenarios; we can use `gdal_translate`
  for all of them instead of `gdal_edit.py`. `gdal_translate` won't edit in place, so
  that would be an improvement.~~
* Generate a list (at least a few) of dataset suggestions in case groups cannot
  come up with one of their own. Check backlog for new layer suggestions.
    * Datasets which have interesting processing in QGreenland
    * See dataset suggestions in Jira
* Revisit geospatial concepts and terms slides. Answer these questions:
    * what does it take to make vector data usable in a GIS/alongside other geospatial data
        * Points contain the coordinates for all features. We need to know the
          CRS that those coordinates are in.
    * what does it take to make raster data usable in a GIS/alongside other geospatial data
        * Rasters are grids, where each cell is indexed in 'image coordinate'
          space (rows and columns). We can transform between image and spatial
          coordinates through an affine/geotransform.
            * _TODO: what about NetCDF where the x/y and lat/lon variables are included?_
        * So we need to know where the upper left pixel is located in space,
          what the pixel size is, and the orientation/rotation of those pixels
          (usually none ('north' is 'up').
        * We also need to know what the CRS those coordinates.


### Work products

* Consider establishing a required structure for work products. E.g. your repository
  must include: `README.md`, `wrangle_data.ipynb`, and `analyze_data.ipynb`. In this
  way, model splitting a problem into parts, and encourage focused, clean notebooks.


### Citation

* For Wikimedia Commons images, use their "embed in site" feature which includes an
  automatically-generated citation


## Run-of-show

### Timing / scheduling

* Consider a 4th optional day of workshop with a "hook" to encourage attendance,
  followed by office hours.
* Include a break (or two) in each day's schedule. Break every hour? 90 minutes? How
  long to break?
* Consider adding some buffer time before and after break for things to run
  long. A longer break is better than a shorter break.
* Keep a timer/alarm for making sure we stay on target and don't miss the break.
* Think about ways to encourage larger-group discussions following breakout rooms.


### Group work

* Encourage rotation of "driver" responsibility in breakout groups.
* Talk briefly about pair/group programming?
    * Full module on live group collaboration (in the style of pair/group programming)?
* Should we expect any attendees to be concerned about credit-sharing for
  analysis done during workshop? Should we note that any papers produced
  directly from ideas developed in this workshop should include a citation of
  QGreenland and the workshop small group as collaborators?


#### Breakout room activity ideas

* What approaches to data introspection have you used / are you comfortable with?
    * What can you teach your teammates?
    * What can your teammates teach you?
* Discuss experiences with geospatial data


### Workshop organization

* Consider announcing groups ahead of the workshop. This might allow
  participants to reach out to each other ahead of time, read introductions for
  their group members, etc.


## Infrastructure

### CI

* Consider `pyspelling` instead of `markdown-spellcheck`? Supports `hunspell` (current)
  and `aspell`.


### Zoom

* Consider having a "quiet" breakout room in Zoom for those who prefer to not talk while
  working.


## Misc

### Automated FAIR / other quality checks

The NCEAS has an [automated checking tool](https://github.com/NCEAS/metadig-checks).

It's deployed on DataONE, e.g.
[here](https://arcticdata.io/catalog/quality/s=FAIR-suite-0.3.1/doi%3A10.18739%2FA2KW57K4R)

Can/should we integrate this tool into the workshop?


### Quarto issues

* The HTML table of contents for prerequisites can't be made to full expand using
  `toc-expand: true`. Can we reproduce?


## Post-workshop

* Consider how materials developed for this workshop might be converted into
  [CIRES data
  puzzles](https://datapuzzles.org/virtual-workshops/tipping-point-virtual-teacher-workshop).
