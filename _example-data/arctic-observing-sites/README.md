# Arctic Observing Viewer Sites

The included `arctic_data_collection_sites.gpkg` was obtained from the [Arctic
Observing Viewer](https://arcticobservingviewer.org/web-services) using the
following command on 2023-05-12:

```
ogr2ogr arctic_data_collection_sites.gpkg "WFS:http://arcticgeoservices.org/arcgis/services/public/Arctic_Data_Collection_Sites/MapServer/WFSServer?request=GetCapabilities&service=WFS"
```

This on-disk dataset is only one option for accessing the data. Try accessing
the data via WFS in QGIS for the most-up-to-date records.

## Data Citation

Manley, W.F., Gaylord, A.G., Kassin, A., Cody, R., Vargas, S.A., Barba, M.,
Dover, M., Escarzaga, S., Habermann, T., Tweedie, C.E., Villarreal, S., and
Whitty, N., 2018, Arctic Observing Viewer (AOV): Englewood, Colorado USA, CH2M
HILL Polar Services. Digital Media. http://arcticobservingviewer.org.
