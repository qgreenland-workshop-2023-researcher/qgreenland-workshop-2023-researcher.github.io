---
title: "Symbolizing datasets together"
index: 90
---

## 🌐 Symbolize data in QGIS


Add the datasets you looked at in the [Data cross-compatibility
exercise](./data-compatibility.md) to QGIS. Use the **Symbology** tab in
each layer's **Properties** window to adjust the symbology so that the two
datasets are visualized together in a meaningful way.

Items to consider: 

* For colormaps: 
  * Color-blind friendly? 
  * Perceptually uniform?
  * Contrast with basemap?
  * Contrast with other map elements?
* For vector features:
  <!-- alex ignore color -->
  * Color
  * Marker shape/pattern
  * Size/thickness of points/lines
  * Fill/transparency of polygons
  * Grouping of many features in close proximity
  * Labels (See the **Labels** tab in the layer's **Properties** window)
* Scale-dependent rendering (See the **Rendering** tab in the layer's
  **Properties** window).

If you're struggling to visualize a particular dataset in QGIS, consider the [example
datasets](/content/prerequisites/dataset-selection.md#having-trouble-choosing).


##  🗃️ Save your symbology choices

For both layers, save your symbology choices as a `.qml` file with a meaningful
name. Add these style files to your team’s GitHub repository.


## ⏱️ Finished early?

Consider enabling other layers from QGreenland and visualizing them alongside your data,
for example the satellite imagery layers in the "Internet-enabled data" layer group. How
would this change your symbology choices? Consider whether data transformation would
also help with this visualization. For example, raster data could be converted to
contours using the [QGIS Processing
Toolbox](https://docs.qgis.org/3.28/en/docs/user_manual/processing/toolbox.html).

Don't forget to save any changes to your GitHub repository. For fun, consider examining
the commit history in GitHub and viewing the difference between two versions of your
style file!
