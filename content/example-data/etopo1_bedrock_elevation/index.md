# ETOPO1 bedrock elevation data for Greenland

The included GeoTiff data file,
[ETOPO_2022_v1_60s_greenland_surface.tif](/content/example-data/etopo1_bedrock_elevation/ETOPO_2022_v1_60s_greenland_surface.tif),
is [ETOPO Global Relief
Model](https://www.ncei.noaa.gov/products/etopo-global-relief-model) Ice surface
data for Greenland downloaded through the [National Centers for Environmental
Information's Grid Extract tool](https://www.ncei.noaa.gov/maps/grid-extract/).

The following `wget` command was used to fetch the data:

```
wget -O ETOPO_2022_v1_60s_greenland_surface.tif "https://gis.ngdc.noaa.gov/arcgis/rest/services/DEM_mosaics/DEM_all/ImageServer/exportImage?bbox=-80.00000,55.00000,0.00000,85.00000&bboxSR=4326&size=4800,1800&imageSR=4326&format=tiff&pixelType=F32&interpolation=+RSP_NearestNeighbor&compression=LZ77&renderingRule={%22rasterFunction%22:%22none%22}&mosaicRule={%22where%22:%22Name=%27ETOPO_2022_v1_60s_surface%27%22}&f=image"
```

## Data Citation

NOAA National Centers for Environmental Information. 2022: ETOPO 2022 15
Arc-Second Global Relief Model. NOAA National Centers for Environmental
Information. DOI: 10.25921/fd45-gt74. Accessed [date].
