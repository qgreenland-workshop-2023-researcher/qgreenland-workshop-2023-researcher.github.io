# 2023-03-30 workshop review

## Site overview

### Prereqs

* ~~Code of conduct~~: Separate one for contributors and attendees?
    * Call out things like "power dynamics", creating space for "being human"/forgiving
      of imperfection. See [Slack
      suggestion](https://nsidc.slack.com/archives/CRB96FG68/p1680214782923999)
    * ‼️ ~~review code of conduct as a group in first slide deck~~
* 💡 ~~Team members (myself, Trey, Alyse, maybe Twila) should post an introduction in the
  GH Discussions to "break the ice".~~
    * ~~Test that non-members of our org can post to Discussions~~
* 💡 ~~Pre-populate the "Dataset Ideas" section of GH Discussions with multiple posts,
  each detailing one "fallback" dataset for groups that have trouble picking one.~~
* ~~Clean up/remove assessment page.~~
* ~~‼️ Do we need each user to fill out the CryoCloud survey??~~
    * Yes, each user should fill out survey, per Tasha


### Module review

#### Overview

* ~~Remove "Day 1 overview" slides, but keep workshop overview slides. We can do the daily
  overviews from the "Materials" page to avoid keeping things in sync with slides.~~
* ~~Icebreaker: Pick a question from a list to introduce yourself.~~
* ~~Icebreaker: "Tell a _short_ story about your interest in Greenland"~~
* ~~Icebreaker: "Something unique about yourself"~~
* ~~If we use Slack, add slides to overview. What should go in Slack and what should go in
  Discussions?~~


#### Intro to JupyterHub

* ~~Change "small" server requirement to specific number of CPUs and RAM: 4GB~~
    * ~~Slide about monitoring memory/CPU usage (bottom-left of JupyterHub window)~~
* ~~Add screenshots of File Browser, application icons.~~
* ~~Clarify which parts are demo and which parts are "follow along". E.g.: "We're going to
  show you how this works, then take 5 minutes to do it on your own." or "We're going
  to go through this together."~~
    * ~~💡 Set this expectation on a title slide~~
* 💡 Show example of how literate programming in a notebook _looks_ during slides. Small
  portions of notebooks that demonstrate useful concepts, even if this means repeating
  some things!
* ~~When demoing the notebook, ensure that we narrate double-clicking markdown cells to
  show the source of it. And also how to expand/collapse cells.~~
* ~~In the exercise to change "red" to "green", suggest that if they're done early they
  can try out some other things, like changing projection.~~
* ~~‼️ In the exercise, remind people to log out?~~
    * ~~No, we plan other exercises using jupyterlab after the break.~~


#### Geospatial concepts and terms

* ~~Clarify continuous vs categorical; there's a symbology aspect and a data value aspect.
  ADD SPEAKER NOTES!~~
* ~~Combine "lossy" and "reproject only once" to one bullet. ADD SPEAKER NOTES! What does
  "lossy" mean? How do multiple reprojections increase uncertainty/error, decrease
  quality?~~
* ~~Remove "other data types" slide.~~
    * ~~Move to "continued learning"?~~
    * ~~Can we make time on day 3/4 for those "bonus" topics?~~
* More on "Metadata standards" slide; instead of just listing them, why would you care
  about them?
* ~~Drop "Tools for inspecting metadata" slide;~~ move GUI (Panoply) application
  recommendations to "inspecting" deck.


##### Exercise

* ~~Rephrase "select a dataset" to "select a _main_ dataset". Specify "Your group can use
  a different dataset at different times if it's more appropriate for a specific
  exercise."~~


#### Inspecting data

* ~~At the beginning, suggest the LoC as a place to start to answer questions about a
  format. Specifically point people to the "Licensing and patents" section.~~
* ~~Expand the "OGC" acronym in the first slide it's mentioned. Explain what they are and
  what they do in speaker notes.~~
* ~~CSV/TSV: Expand acronyms~~
    * ~~Code cell with CSV data~~
* ~~XLS: screenshot of Excel~~
* ~~ESRI Shapefile: Directory listing of example files (`.prj`, `.?`)~~
* ~~Others: Remove and add Library of Congress data formats + OGC standards link to
  continued learning~~
* ~~Rasterio CLI: Mention in speaker notes that it has both a CLI and Python
  interface.~~
* ~~Consider e.g. in Rasterio slides, having a dedicated slide to showing the "help"
  output.~~
* ~~Move "OGR used to stand for" to speaker notes.~~
* ~~In "Raster with no metadata" slide, call out the upper left corner's value is 0,0 as a
  red flag.~~
* ~~Consider showing missing metadata on a vector datasource.~~


##### Exercise

* ~~Remove "Run the example notebook"~~
* ~~Remove "Change the color of Greenland"~~
* ~~💡 Create an example notebook for this exercise using an existing QGreenland
  layer.~~
* ~~Remove "Push to GitHub", not covered until day 2.~~


#### Intro to GitHub

* ~~Ask them to commit the notebook they made on Day 1 to GitHub.~~


### Misc

* ~~Are we going to have too many communications channels? Slack + Discussions + Zoom: too
  much?~~
* ~~If we decide to use Slack, add sign-up to prereqs!~~
* Consider presenting video recordings live (not simply play the presentation)? Enables
  us to stop for questions.
* ~~For group exercises, encourage them to rotate the "driver" responsibility, or
  encourage them all to do the same steps on their own computers. Or be explicit: Are
  there some exercises that should be done as a group and others that should be
  implemented by everyone?~~
* We should demo creating a new notebook so everyone knows how. Add a screenshot of the
  "new tab" button on a "Creating a new Jupyerlab tab/window" slide.
* ~~Ensure each person can have a personal interaction with GitHub, JupyterLab, data. We
  don't want the experts to be the only ones _doing_. Encourage experts in groups to
  play a support role to non-experts.~~
* ‼️ ~~Intra-group teaching is an expectation of the workshop! Advertise this on the front
  page.~~
* ‼️ ~~Create a new section of the site for "Running the workshop" or "For
  administrators" which includes a checklist.~~
    * ~~Discuss roles for administrators in each workshop. Do we need more people to
      fill those roles? e.g. MC students?~~
    * ~~Ensure our workshop's Zoom meeting is set to disable annotations.~~
* ~~More reminders to log out of JH, e.g. at the end of each day's final module.~~
