#!/bin/bash

gdal_translate -a_srs datafile.prj -a_ullr -334334.200 -1855796.425 -327188.537 -1860658.423 datafile.jpg datafile.tif
