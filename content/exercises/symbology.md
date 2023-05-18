---
title: "Symbolizing datasets together"
index: 90
---

## 🌐 Symbolize data in QGIS


Add the datasets you looked at in the [Data cross-compatibility
exercise](exercises/data-compatibility.md) to QGIS. Use the **Symbology** tab in
each layer's **Properties** window to adjust the symbology so that the two
dataests are visualized together in a meaningful way.

Items to consider: 

* For colormaps: 
  * Color-blind friendly? 
  * Perceptually uniform?
  * Contrast with basemap?
  * Contrast with other map elements?
  * 
* For vector features:
  * Color
  * Marker shape/pattern
  * Size/thickness of points/lines
  * Fill/transparency of polygons
  * Grouping of many features in close proximity
  * Labels (See the **Labels** tab in the layer's **Properties** window)
* Scale-dependent rendering (See the **Rendering** tab in the layer's
  **Properties** window).


##  🗃️ Save your symbology choices

For both layers, save your symbology choices as a `.qml` file with a meaningful
name. Add these style files to your team’s GitHub repository.
