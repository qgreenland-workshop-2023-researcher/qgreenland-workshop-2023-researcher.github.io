<img alt="NSIDC logo" src="https://nsidc.org/themes/custom/nsidc/logo.svg" width="150" />

# QGreenland 2023 Researcher Workshop

A workshop run by the QGreenland team targeting researchers as the primary audience.

[`quarto`](https://quarto.org/) is used to generate the [workshop
website](https://qgreenland-workshop-2023-researcher.github.io/) from this repo
via [GitHub Actions](.github/workflows/publish-to-quarto-website.yml) on pushes
to the `main` branch.


## Level of Support

This repository is not actively supported by NSIDC but we welcome issue submissions and
pull requests in order to foster community contribution.

See the [LICENSE](LICENSE) for details on permissions and warranties. Please contact
nsidc@nsidc.org for more information.


## License

See [LICENSE](LICENSE).


## Code of Conduct

See [Code of Conduct](CODE_OF_CONDUCT.md).


## Credit

This software was developed by the National Snow and Ice Data Center with funding from
multiple sources.


## Development

To develop the workshop website locally, install the dependencies via `conda`:

```
$ conda env create
$ conda activate qgreenland-researcher-workshop
```

Then use the `quarto preview` command to start a local server for the website
that will live-reload on changes to source content (`.qmd` files).


### Fixing spelling mistakes

`mdspell` is used to check for spelling pistakes in source files. If the linter
catches spelling mistakes, use `./scripts/spell-check.sh -i` to interactively
correct mistakes (or add exceptions).
