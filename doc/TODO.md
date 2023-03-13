# TODO


## CI

* Consider `pyspelling` instead of `markdown-spellcheck`? Supports `hunspell` (current)
  and `aspell`.


## Compute environment

How do we solve the problem of diverse computing environments? We want to minimize the
support burden because we have poor Windows/MacOS knowledge, but also want to make
completing exercises and viewing results graphically (in QGIS) as convenient as
possible.

* Provide Linux VMs with pre-configured tooling to upload to / download from the VMs
  disk
    * Pros: Consistent compute environment, transferrable Linux skills
    * Cons: Convenience of accessing/sharing data, bandwidth
* Provide VMs with graphical desktop to perform all operations (e.g. Amazon Workspaces)
    * Pros: Full standardization of compute environment, transferrable Linux skills
    * Cons: Bandwidth
* Require as a prerequisite that users install and configure a conda environment on
  their local computer
    * Pros: Less infrastructure required (time and $ cost), everything happens in a
      familiar environment
    * Cons: Large number of confounding variables we not be able to support
* Use JupyterHub to interact with compute resources? `%%shell` enables running bash
  (`gdal`/`ogr` commands) in notebook cells. Can we run desktop GUI apps like QGIS?
  [jupyter-qgis](https://github.com/giswqs/jupyter-qgis). We can sync data with
  Syncthing. Could use <https://github.com/berkeley-dsep-infra/datahub> as a resource.
  Could [contact 2i2c](https://2i2c.org/service/#getahub) to investigate whether their
  service would be a good fit.
    * Pros: Consistent Python environment
    * Cons: ???

If we require local configuration, we should provide in-advance office hours to support
users who are struggling with installing dependencies.


## Slides / presenting

* How can we split our pile of slides in to multiple focused decks?
    * [x] Build a Quarto web page in addition to the slides, and include links to slide
      decks?
    * 1 deck per day? Or more focused than that?
* Does our conda environment need the whole `jupyter` metapackage, or just one piece?
* Can we pre-record presentations? More control over timing, more end-user control over
  the presentation, e.g. skipping parts they already understand or rewinding parts when
  they require review.
* Limit live presentations to brief overviews of topics, providing supporting materials,
  e.g. pre-recorded topic presentations. Focus on solving problems as a group and
  directly supporting groups.
* Diversify background imagery; currently have one cropped Icebridge DMS image, but
  could also use images from [NSIDC's Flickr
  account](https://www.flickr.com/photos/nsidc/albums/72157715526805678)


## Timing / scheduling

* Consider a 4th optional day of workshop with a "hook" to encourage attendance,
  followed by office hours.


## Improve presentation of this Git repository

### Content

* Clean up curriculum: Should be bullet points of topics and time spent on each topic.
  Extract details for each topic into separate documents.

* Index curriculum into modules, e.g. Day 1's third module could be `1C`.


### View

* [x] Consider a SSG for making an improved web-based "view" of this Git repository,
  e.g. MkDocs
    <!-- alex ignore special -->
    * A good demo of something special you can do with CI


## Workshop organization

* Consider announcing groups ahead of the workshop. This might allow
  participants to reach out to each other ahead of time, read introductions for
  their group members, etc.


## Workshop materials

* Generate a list (at least a few) of dataset suggestions in case groups cannot
  come up with one of their own. Check backlog for new layer suggestions.
    * Datasets which have interesting processing in QGreenland
    * See dataset suggestions in Jira


## Work products

* Consider establishing a required structure for work products. E.g. your repository
  must include: `README.md`, `wrangle_data.ipynb`, and `analyze_data.ipynb`. In this
  way, model splitting a problem into parts, and encourage focused, clean notebooks.


## Automated FAIR / other quality checks

The NCEAS has an [automated checking tool](https://github.com/NCEAS/metadig-checks).

It's deployed on DataONE, e.g.
[here](https://arcticdata.io/catalog/quality/s=FAIR-suite-0.3.1/doi%3A10.18739%2FA2KW57K4R)

Can/should we integrate this tool into the workshop?
