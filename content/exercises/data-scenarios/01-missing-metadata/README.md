# Data Scenario: Missing Metadata

You download a dataset which doesn't load as expected in QGIS. When loaded alongside
QGreenland, instead of overlaying the DEM on Greenland, it can be found near the North
pole using the "Zoom to Layer" feature.

_NOTE: The included data file sample is not a real example of data from NSIDC; it's been
modified from the original ([here](https://nsidc.org/data/nsidc-0092/versions/1)) to
present a challenge._

The landing page from which you downloaded this DEM states the dataset's proj4 string
is:

```
+proj=stere +lat_0=90 +lat_ts=71 +lon_0=-39 +x_0=0 +y_0=0 +a=6378137 +rf=298.257024882273 +units=m +no_defs
```

And the corner coordinates are:

```
Upper Left  ( -802500.000, -597500.000)
Lower Right (  702500.000,-3402500.000)
```
