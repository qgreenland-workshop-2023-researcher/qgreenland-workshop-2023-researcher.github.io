# Data Scenario: Raster Data Needs Reformatting

A colleague e-mails you aerial imagery of a potential study site that you would
like to view in QGIS alongside some other data. The person who provided the data
gives you the following details:


Corner coordinates for the data file are:

```
Upper Left  ( -334334.200,-1855796.425) ( 55d12'45.62"W, 72d43'11.00"N)
Lower Left  ( -334334.200,-1860658.423) ( 55d11'11.56"W, 72d40'35.44"N)
Upper Right ( -327188.537,-1855796.425) ( 54d59'55.86"W, 72d43'51.77"N)
Lower Right ( -327188.537,-1860658.423) ( 54d58'23.69"W, 72d41'16.09"N)
```

The projection information is given as "Well Known Text" (WKT) in the provided
`datafile.prj` file.

Given this information, create a GeoTiff file that can be loaded into QGIS and
viewed alongside other data in QGreenland.


# Citation information

The provided `datafile.jpg` was extracted from NASA Operation Icebridge DMS
imagery. Specifically, the `DMS_1000211_02076_20100409_17225023.tif` file was
subsetted and converted to jpg for the purposes of this exercise.

Credit is given to:

```
Dominguez, R. (2010). IceBridge DMS L1B Geolocated and Orthorectified Images,
Version 1 [Data Set]. Boulder, Colorado USA. NASA National Snow and Ice Data
Center Distributed Active Archive
Center. https://doi.org/10.5067/OZ6VNOPMPRJ0. Date Accessed 01-26-2023.
```
