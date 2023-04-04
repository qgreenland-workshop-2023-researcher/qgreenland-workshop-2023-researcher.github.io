# Materials review 2023-04-04

## Modules

### Intro to GitHub

* On the first slide, add an explanation of the scope of this "intro"; we want to give a
  "taste", and to that end we're streamlining this material and not focusing on
  advanced/intermediate topics.
* Make a Git vs GitHub slide
    * <https://www.earthdatascience.org/courses/intro-to-earth-data-science/git-github/version-control/>
* Mention alternatives to GitHub
* How to set up permissions, or set up org-level defaults
* Useful references slide:
    * GFM doc links are hard to distinguish
    * Link to thinks that will be immediately useful for the upcoming exercises
    * Give a sense of what's possible with Git/Hub
    * Link to continued learning section


#### Exercise

* Add link to Git-focused continued learning resource
* Change mention of "Data Inspection" exercise to a link
* Re-estimate the time commitment
* Suggest choosing a driver who has never created a repo
* 💡 Convert to individual repository exercise? Or start with group repo, then split to
    create individual repo as a bonus exercise
    * Create a repo in their own namespace `<username>/<username>` with a `README.md`
      that will show up as their "personal profile" on `github.com/<username>`. Can
      source the content from the introduction they posted to Discussions.
* Warning about GitHub browser interface: Change wording to `We request that everyone
    use the GitHub browser interface. If you choose not to, be prepared to support your
    group if issues like merge conflicts arise. See <link to CryoCloud Git gotchas> for
    details on using Git in CryoCloud.`
* Add a warning for users who plan to use Git within CryoCloud. How to do credentials
  correctly?


### Open Science (and data) principles

* Add `TRUST` data principles to the slide deck
* Examples of what `FAIR`-compliance and non-compliance looks like. Can we demo a
  particular landing page that is amazing? What are common failures, e.g. having to
  click around in an interface. Look at our private archive READMEs for inspiration! Can
  we find a dataset that can only be mailed on CD-ROM?
    * Red flag for `FAIR`ness: A paper that says "email me for the data"
* Alyse has some slides from Natasha Heacox Chavez on `CARE`. Alyse will reach out and
  ask permission to re-use a slide!


#### Exercise

* Discuss the output of the "Data inspection" exercise; what does this mean for
  FAIR-compliance?
* Mix up the breakout groups for this exercise


### Fixing common data/metadata

* Remove WIP marker on the slides
* Add screenshot to the data scenario description; source from slides demonstrating what
  "missing metadata" looks like in QGIS
* Apply code cell standards from "inspecting" slide deck
* "Vector data needs reformatting" data scenario needs a listing of its files
* Add syntax highlighting to JSON output on "vector reformatting" slides
* Remove `>>` from `gdalsrsinfo` code block
* Remove "Advanced techniques" slides; the info is in continued learning already (or
  should be)


### Exercise

* Turn "Missing NoData value" slides into an exercise?
* Consider rating each scenario's difficulty?
* Choose a scenario, but solve it differently than the demo?
* More time focusing on own data, less time on this exercise.
* Use extra time to try other scenarios, or try different methods on same scenarios.
* If your group's dataset is looking great, what about other individuals' personal
  dataset(s)? Look at those as a group.
* On the 🪦 slide, link to continued learning about topics like georegistration.


## Misc

* ‼️ Create space for asking questions in the morning!
* Create an overview checklist with:
    * Discuss the modules we'll cover today
    * Questions from yesterday?
* Create administrator documentation 
    * Daily checklist
        * When/how to record
    * Roles
* Communicate clearly that QGreenland inclusion is not guaranteed for chosen datasets.
* Show/demo the ADC QGreenland portal? Emphasize that improving this portal is going to
  be one of our major focuses.
* What does contributor workflow look like if people want to add to the package? We
  don't want "inconsequential" layers. E.g. start with an issue to discuss viability of
  dataset, then open PR.
