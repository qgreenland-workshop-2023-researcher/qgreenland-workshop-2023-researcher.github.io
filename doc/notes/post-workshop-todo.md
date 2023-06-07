# Post-workshop TODO

## Jupyter blog post

* ~~Start a post on a collaborative platform (HackMD, Google Docs), and invite Yuvi
  Panda to edit after we've got a first draft. We can contact Yuvi on Openscapes
  Slack.~~


## CryoCloud cleanup

* Check for notebooks in `shared/public` that could be added to the group GitHub
  repositories


## Workshop website updates

* ~~Add a "this workshop is completed" notice to front page (info / warning box?)~~
* ~~Thank attendees for their high quality participation~~


### Remove OBE content

* ~~Remove links to application materials~~
* ~~Cross out workshop dates and replace with a completion message~~


### New "Outcomes" top-level nav

* ~~Thank participants for an awesome workshop~~
* ~~Highlight deliverables (see next section)~~
* Link to our blog post
* Link to Hacker News post


#### Review deliverables

* ~~Participants now have GitHub profiles with activity.~~

* ~~Participants engaged on workshop topics in small groups and established new connections~~

* ~~What are some interesting:~~
    * ~~Notebooks~~
        - Group 1
            * [`GDAL_dataset_information.ipynb`](https://github.com/qgreenland-workshop-2023-researcher/group-one/blob/main/GDAL_dataset_information.ipynb):
              Inspects ETOPO data using Python (`osgeo.gdal`, `cartopy`,
              `xarray`) and `gdalinfo`
            * [`Python_ds_analysis.ipynb`](https://github.com/qgreenland-workshop-2023-researcher/group-one/blob/main/Python_ds_analysis.ipynb):
              Uses `Python` (`osgeo.gdal`, `matplotlib`, `cartopy`, `geopandas`) to reproject, plot, and resample
              ETOPO dataset. Attempt to clip unsuccessful.
        - Group 2
            * [`metadata.ipynb`](https://github.com/qgreenland-workshop-2023-researcher/group-two/blob/main/metadata.ipynb):
              inspects MEaSURES Greenland Annual Ice Sheet Velocity Mosaics
              dataset using both python and `gdalinfo` (CLI)
        - Group 3
            * [`exercise_inspect_data.ipynb`](https://github.com/qgreenland-workshop-2023-researcher/group-three/blob/main/exercise_inspect_data.ipynb):
              utilized `gdalinfo`, `ncdump`, `Python` (`xarray`) to inspect
              CMIP5 data. Also fetched hot springs data with `wget` and
              inspected it using `pandas`.
            * [`exercise_fixing_metadata.ipynb`](https://github.com/qgreenland-workshop-2023-researcher/group-three/blob/main/exercise_fixing_metadata.ipynb):
              attempts to use `gdalwarp` to fix missing CRS information.
        - Group 4
            * [`Qiceradar_fix.ipynb`](https://github.com/qgreenland-workshop-2023-researcher/group-four/blob/main/Qiceradar_fix.ipynb):
              Uses `ogrinfo` and `Python` (`geopandas`) to inspect GeoPackage
            * [`Group_four-new.ipynb`](https://github.com/qgreenland-workshop-2023-researcher/group-four/blob/main/Group_four-new.ipynb):
              Inspects vegetation biomass layer from QGreenland usign Python.
            * [`data_comp_1_4.ipynb`](https://github.com/qgreenland-workshop-2023-researcher/group-four/blob/main/data_comp_1_4.ipynb):
              Clipped the DEM from group 1 with the dataset from group 4.
        - Group 5
            * [`data_inspection.ipynb`](https://github.com/qgreenland-workshop-2023-researcher/group-five/blob/main/data_inspection.ipynb):
              Uses `ogrinfo` (CLI) and `Python` (`geopandas`) to inspect arctic
              data collection sites. Also used `Python` (`xarray`) to inspect
              Sermilik Fjord data.
        - Group 6
            * [`DescribeData.ipynb`](https://github.com/qgreenland-workshop-2023-researcher/group-six/blob/main/DescribeData.ipynb):
              Uses `fiona` and `ogrinfo` to inspect HydroLAKES dataset.
        - Group 7
            * [`GIS_D.ipynb`](https://github.com/qgreenland-workshop-2023-researcher/group-seven/blob/main/GIS_D.ipynb):
              Inspects ice discharge PROMICE dataset using `Python` (`netCDF4`)
    * ~~Discussions posts (specifically FAIR/CARE)~~
        * ~~Include word cloud~~
        * ~~Highlight some important insights~~


### Lessons learned

* ~~Overall impressions~~
* ~~Changes we'd want to make~~
    * ~~Symbology exercise: deliverable in addition to qml files? Screenshot? Discussion post?~~
    * ~~More time for exercises, especially on day 1. Maybe allocate more time than 9
      hours, or cover fewer topics.~~
    * ~~Should be more clear on file names/structure for git repos. Initially hard to tell which notebooks correspond to each exercise.~~
    * ~~Archive workshop materials? E.g., Everything in qgis-data?~~
* ~~Tips and tricks for running workshop~~
    * ~~Let people join their own breakout rooms; trying to predict what e-mail people
      will join Zoom with and pre-configuring breakout rooms turned out to be a time
      sink. Inevitably, some will join from their phone, not sign in, etc. resulting in
      spending time manually setting up breakout rooms.~~


## GitHub Discussions announcements

* When outcomes page goes live, make an announcement thanking participants for making
  the workshop a success.
* When Jupyter blog post goes live, make another announcement.


## Create a template/read-only run-of-show document

Do this.
