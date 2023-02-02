# Data Scenario: Data file needs reprojection

A colleague has sent you a CSV file containing the locations of potential field
study sites in Greenland. The CSV provides coordinates in latitude and longitude
(EPSG:4326 / WGS84) but your site suitability analysis code expects coordinates
in NSIDC Polar Stereogrpahic North (EPSG:3413). Furthermore, your code expects
that the potential sites be provided as a GeoPackage (`.gpkg) file.

Reproject `datafile.csv` from `EPSG:4326` to `EPSG:3413` and convert the format
to GeoPackage.
