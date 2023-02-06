# TODO

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


## Slides

* Look into `quarto create project` to set up some boilerplate (e.g. gitignore entries)
  for Quarto projects
* Does our conda environment need the whole `jupyter` metapackage, or just one piece?


## Improve presentation of this Git repository

### Content

* Clean up curriculum: Should be bullet points of topics and time spent on each topic.
  Extract details for each topic into separate documents.

* Index curriculum into modules, e.g. Day 1's third module could be `1C`.

* Add list of references that might be useful to attendees. Consider taking content from
  `doc/development_references.md`


### View

* Consider a SSG for making an improved web-based "view" of this Git repository, e.g.
  MkDocs
    <!-- alex ignore special -->
    * A good demo of something special you can do with CI
* Consider leaving this Git repository without a "view" layer; introduce attendees to
  the utility of Markdown rendered by GitHub.


## Workshop organization

* Consider announcing groups ahead of the workshop. This might allow
  participants to reach out to eachother ahead of time, read introductions for
  their group members, etc.
