# TODO

## Compute environment

How do we solve the problem of diverse computing environments? We want to minimize the
support burden because we have poor Windows/MacOS knowledge, but also want to make
completing exercises and viewing results graphically (in QGIS) as convenient as
possible.

* Provide Linux VMs with pre-configured tooling to upload to / download from the VMs
  disk
    * Pros: Consistent compute environment, transferrable Linux skills
    * Cons: Convenience of accessing/sharing data, bandwitdh
* Provide VMs with graphical desktop to perform all operations (e.g. Amazon Workspaces)
    * Pros: Full standardization of compute environment, transferrable Linux skills
    * Cons: Bandwidth
* Provide a Jupyter notebook server that is shared
    * Pros: Consistent Python environment
    * Cons: How to make it convenient to access data?, does this solve for GDAL?
* Require as a pre-requesite that users install and configure a conda environment on
  their local computer
    * Pros: Less infrastructure required (time and $ cost), everything happens in a
      familiar environment
    * Cons: Large number of confounding variables we not be able to support
* Use JupyterHub to interact with compute resources? `%%shell` enables running bash
  (`gdal`/`ogr` commands) in notebook cells. Can we run desktop GUI apps like QGIS?
  [jupyter-qgis](https://github.com/giswqs/jupyter-qgis)
    * Pros: ???
    * Cons: ???

If we require local configuration, we should provide in-advance office hours to support
users who are struggling with installing deps.
