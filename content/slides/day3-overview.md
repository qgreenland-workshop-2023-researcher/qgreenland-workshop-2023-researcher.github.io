---
title: "Day 3 Overview"
subtitle: "QGreenland Researcher Workshop 2023"
index: 999
background-image: "https://live.staticflickr.com/65535/50171104477_4042c97a90_k.jpg"
---

## Communication reminders {.smaller}

* GitHub Discussions
  * Questions
  * Lingering problems
  * Showing off something cool
  * Discussion (FAIR & CARE, introductions, etc.). Engage with other
    participants and learn from each other!
* Use slack for immediate needs and to alert organizers to any issues
  * Groups listed in a pinned post on slack channel
  * Matt & Trey will be checking in on breakout rooms periodically today. Let us
    know in slack if you want help!

## Reminder: `qgis-data`

:::{.callout-warning}
Data in “qgis-data” will be deleted post-workshop.
:::

## Reminder: Continued learning

[Continued learning](/content/continued-learning.html)

## Panoply

![[Panoply is an excellent GUI-based tool for inspecting HDF/NetCDF files!](https://www.giss.nasa.gov/tools/panoply/)](https://www.giss.nasa.gov/tools/panoply/gfx/panoply_500_1440x960.png) 
 
 
## Using `gdalinfo` to inspect NetCDF files {.smaller}

By default, using gdalinfo will show an overview of 'global'/file-level metadata and list all available subdatasets.

For example,

```{.default}
(notebook) jovyan@jupyter-trey-2dstafford:~$ gdalinfo airtemp_cmip5_rcp85_mmm_2006_2055.nc
Driver: netCDF/Network Common Data Format
Files: shared-public/QGreenland-Researcher-Workshop/group-three/airtemp_cmip5_rcp85_mmm_2006_2055.nc
Size is 512, 512
Metadata:
  NC_GLOBAL#acknowledgement=We acknowledge the World Climate Research Programme's Working Group on Coupled Modelling, which is responsible for CMIP, and we thank the climate modeling groups listed below for producing and making available their model output. For CMIP the U.S. Department of Energy's Program for Climate Model Diagnosis and Intercomparison provides coordinating support and led development of software infrastructure in partnership with the Global Organization for Earth System Science Portals. More information on the Coupled Model Intercomparison Project (CMIP5) and the 5th Assessment of the IPCC can be found here: http://cmip-pcmdi.llnl.gov/cmip5/index.html
  NC_GLOBAL#experiment=rcp85
  NC_GLOBAL#futuretime=2006-2055
  NC_GLOBAL#historictime=1956-2005
  NC_GLOBAL#history=This data file was produced at NOAA/ESRL/PSD with the support of the US Bureau of Reclamation, US Army Corps of Engineers, and CIRES with the esrl.noaa.gov/psd/ipcc/ocn website.
  NC_GLOBAL#model=ENSMN
  NC_GLOBAL#variable=tas
Subdatasets:
  SUBDATASET_1_NAME=NETCDF:"shared-public/QGreenland-Researcher-Workshop/group-three/airtemp_cmip5_rcp85_mmm_2006_2055.nc":histclim
  SUBDATASET_1_DESC=[178x360] air_temperature (32-bit floating-point)
  SUBDATASET_2_NAME=NETCDF:"shared-public/QGreenland-Researcher-Workshop/group-three/airtemp_cmip5_rcp85_mmm_2006_2055.nc":anomaly
  SUBDATASET_2_DESC=[178x360] air_temperature (32-bit floating-point)
  SUBDATASET_3_NAME=NETCDF:"shared-public/QGreenland-Researcher-Workshop/group-three/airtemp_cmip5_rcp85_mmm_2006_2055.nc":histstddev
  SUBDATASET_3_DESC=[178x360] air_temperature (32-bit floating-point)
  SUBDATASET_4_NAME=NETCDF:"shared-public/QGreenland-Researcher-Workshop/group-three/airtemp_cmip5_rcp85_mmm_2006_2055.nc":varratio
  SUBDATASET_4_DESC=[178x360] air_temperature (32-bit floating-point)
Corner Coordinates:
Upper Left  (    0.0,    0.0)
Lower Left  (    0.0,  512.0)
Upper Right (  512.0,    0.0)
Lower Right (  512.0,  512.0)
Center      (  256.0,  256.0)
```

---

In the previous output, we see that there are 4 subdatasets (`histclim`,
`anomaly`, `histstddev`, `varratio`):

```
Subdatasets:
  SUBDATASET_1_NAME=NETCDF:"shared-public/QGreenland-Researcher-Workshop/group-three/airtemp_cmip5_rcp85_mmm_2006_2055.nc":histclim
  SUBDATASET_1_DESC=[178x360] air_temperature (32-bit floating-point)
  SUBDATASET_2_NAME=NETCDF:"shared-public/QGreenland-Researcher-Workshop/group-three/airtemp_cmip5_rcp85_mmm_2006_2055.nc":anomaly
  SUBDATASET_2_DESC=[178x360] air_temperature (32-bit floating-point)
  SUBDATASET_3_NAME=NETCDF:"shared-public/QGreenland-Researcher-Workshop/group-three/airtemp_cmip5_rcp85_mmm_2006_2055.nc":histstddev
  SUBDATASET_3_DESC=[178x360] air_temperature (32-bit floating-point)
  SUBDATASET_4_NAME=NETCDF:"shared-public/QGreenland-Researcher-Workshop/group-three/airtemp_cmip5_rcp85_mmm_2006_2055.nc":varratio
  SUBDATASET_4_DESC=[178x360] air_temperature (32-bit floating-point)
```

---

To inspect one subdataset in particular, you need to adjust your command to
include the driver (prefix the filepath) and the subdataset you want to look at
(postfix the filepath). For example, to look at the `anomaly` subdataset:

```{.default}
(notebook) jovyan@jupyter-trey-2dstafford:~$ gdalinfo NETCDF:airtemp_cmip5_rcp85_mmm_2006_2055.nc:anomaly
Driver: netCDF/Network Common Data Format
Files: shared-public/QGreenland-Researcher-Workshop/group-three/airtemp_cmip5_rcp85_mmm_2006_2055.nc
Size is 360, 178
Origin = (0.000000000000000,90.000000000000000)
Pixel Size = (1.000000000000000,-1.000000000000000)
Metadata:
  anomaly#associated_files=baseURL: http://cmip-pcmdi.llnl.gov/CMIP5/dataLocation gridspecFile: gridspec_atmos_fx_MIROC-ESM_rcp85_r0i0p0.nc areacella: areacella_fx_MIROC-ESM_rcp85_r0i0p0.nc
  anomaly#average_op_ncl=dim_avg_n function was applied
  anomaly#cell_methods=time: mean
  anomaly#comment=near-surface (usually, 2 meter) air temperature.
  anomaly#description=Ensemble average climate
  anomaly#history=2011-09-13T04:34:46Z altered by CMOR: Treated scalar dimension: 'height'. 2011-09-13T04:34:46Z altered by CMOR: replaced missing value flag (-999) with standard missing value (1e+20). 2011-09-13T04:34:46Z altered by CMOR: Inverted axis: lat.
  anomaly#info=CMIP5 ENSMN RCP8.5 anomaly (2006-2055)-(1956-2005)
  anomaly#interpolation=bilinearly interplated from original model grid to 1x1 grid for intercomparison
  anomaly#long_name=Near-Surface Air Temperature
  anomaly#missing_value=1e+20
  anomaly#original_name=T2
  anomaly#runave_op_ncl=runave_n: nave=12
  anomaly#season=ANN
  anomaly#standard_name=air_temperature
  anomaly#stat=seasonal mean for time period
  anomaly#units=C
  anomaly#_FillValue=1e+20
  lat#axis=Y
  lat#long_name=latitude
  lat#standard_name=latitude
  lat#units=degrees_north
  lon#axis=X
  lon#long_name=longitude
  lon#standard_name=longitude
  lon#units=degrees_east
  NC_GLOBAL#acknowledgement=We acknowledge the World Climate Research Programme's Working Group on Coupled Modelling, which is responsible for CMIP, and we thank the climate modeling groups listed below for producing and making available their model output. For CMIP the U.S. Department of Energy's Program for Climate Model Diagnosis and Intercomparison provides coordinating support and led development of software infrastructure in partnership with the Global Organization for Earth System Science Portals. More information on the Coupled Model Intercomparison Project (CMIP5) and the 5th Assessment of the IPCC can be found here: http://cmip-pcmdi.llnl.gov/cmip5/index.html
  NC_GLOBAL#experiment=rcp85
  NC_GLOBAL#futuretime=2006-2055
  NC_GLOBAL#historictime=1956-2005
  NC_GLOBAL#history=This data file was produced at NOAA/ESRL/PSD with the support of the US Bureau of Reclamation, US Army Corps of Engineers, and CIRES with the esrl.noaa.gov/psd/ipcc/ocn website.
  NC_GLOBAL#model=ENSMN
  NC_GLOBAL#variable=tas
Corner Coordinates:
Upper Left  (   0.0000000,  90.0000000)
Lower Left  (   0.0000000, -88.0000000)
Upper Right (     360.000,      90.000)
Lower Right (     360.000,     -88.000)
Center      ( 180.0000000,   1.0000000)
Band 1 Block=360x1 Type=Float32, ColorInterp=Undefined
  NoData Value=1e+20
  Unit Type: C
  Metadata:
    associated_files=baseURL: http://cmip-pcmdi.llnl.gov/CMIP5/dataLocation gridspecFile: gridspec_atmos_fx_MIROC-ESM_rcp85_r0i0p0.nc areacella: areacella_fx_MIROC-ESM_rcp85_r0i0p0.nc
    average_op_ncl=dim_avg_n function was applied
    cell_methods=time: mean
    comment=near-surface (usually, 2 meter) air temperature.
    description=Ensemble average climate
    history=2011-09-13T04:34:46Z altered by CMOR: Treated scalar dimension: 'height'. 2011-09-13T04:34:46Z altered by CMOR: replaced missing value flag (-999) with standard missing value (1e+20). 2011-09-13T04:34:46Z altered by CMOR: Inverted axis: lat.
    info=CMIP5 ENSMN RCP8.5 anomaly (2006-2055)-(1956-2005)
    interpolation=bilinearly interplated from original model grid to 1x1 grid for intercomparison
    long_name=Near-Surface Air Temperature
    missing_value=1e+20
    NETCDF_VARNAME=anomaly
    original_name=T2
    runave_op_ncl=runave_n: nave=12
    season=ANN
    standard_name=air_temperature
    stat=seasonal mean for time period
    units=C
    _FillValue=1e+20
```

Now we have all of the details associated with the `anomaly` subdataset!

## Day 3 overview

1. Geospatial transformations and data cross-compatibility
   a. ~20 min slideshow
   b. Multi-group discussion
   c. Group exercise
2. Break
3. Symbolizing geospatial data in QGIS
   a. ~20 min slideshow
   b. Group exercise 
   c. Multi-group discussion
4. Wrap-up
