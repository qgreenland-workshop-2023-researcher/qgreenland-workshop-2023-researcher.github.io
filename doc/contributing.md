# Contributing

## Slides

To develop slides locally and view a preview:

* Create the conda environment from `environment.yml`:

  ```console
  mamba env create
  ```

* Activate the environment

  ```console
  conda activate qgreenland-researcher-workshop
  ```

* Preview the website and slides:

  ```console
  quarto preview
  ```

### Modeline and HTML comments

Please add a modeline to the very top of each `.qmd` document to enable GitHub to render
these documents as markdown. As QMD is a superset of markdown, not all features will
work as expected, but it will look better than plaintext.

```text
<!-- vim: set ft=markdown: -->
```


## Markdown formatting

Markdown format is validated by `markdownlint`. Use `markdownlint .` to run locally.

Use `markdownlint --fix .` to automatically fix linting errors. This only works for some
classes of errors.


## Fixing spelling mistakes

`mdspell` is used to check for spelling mistakes in source files. If the linter
catches spelling mistakes, use `./scripts/spell-check.sh -i` to interactively
correct mistakes (or add exceptions).
