# Geomatics - Geospatial Analysis 

Tutorial and Overview - https://www.youtube.com/watch?v=HzPSVwyP2Y0

## Concepts

Geospatial - information on the earths surface relating to coordinates
* Often associates information with that location

Projection - curved area of the earths surface represented in two dimensions.

Lat/Long - unprojected coordinates

Geocoding - taking a place and getting a set of coordinates back
* https://nominatim.openstreetmap.org/

Open Geospatial Consortium - standards for sharing/storing:
* KML
* GML
* GeoRSS
* WMS
* WFS
* WCS

Geolocation - act of recording your location as you're doing something

## Distance and Lat/Long
 
Positive (West), Negative (East) in terms of longitude.  Latitude Positive (North), Negative (South).
* Parallels - horz
* Meridians - vert

Long wraps at 180 degrees, latitude wraps at 90 degrees.

* Angular - data can be in degrees or radians
* Linear 
* Travelling - via a given path
* Great Circle - use the Harvesine formula to calculate this

Lat/long - degrees, mins and secs - 176° 14' 4''
* Degrees and decimal mins - 176° 14.066'
* Decimal degrees notation - 176.234436°
* Lat/long quadrant can sometimes be separate - 176.234436° E

## Projections

Projection - Creating a 2d map from a 3d representation, always some distortion, three types:
* Cylindrical - Mercator projection, Euqal Area Cylindrical, Universal Traverse
* Conical - Lambert, Albers, Equidistant
* Azimuthal - Gnomonic, Lambert, Orthographic.

## Co-ordinates 

Co-ordinates, two types:
* Projected - projection to a 2d cartesian plane, place points on plane
* Unprojected - difficiult to do distance/geospatial calcs

Both imply a set of reference points.  For projected you define an origin and a set of map units.
* false northing and false easting

The UTM coord system divides the earth into 60 zones

Projected - accurate over small area only
Unprojected - cover the whole earth

Datum:
* Modle used to describe locations
* Set of reference points combined with a model of the earth shape
* NAD27, NAD83 and WGS84

Shapes:
* Points, paths and outlines OR coordinates, linestrings and polygons

Polygons have exterior rings and interior rings (holes)

## GIS Data Formats (p39)

Either raster (DRG, DEM) or vector (Shapefile, Coverage) and they consist of:
* Geospatial info
* Metadata
* Attributes
* Style info

Microformats:
* WKT (Well known text) and WKB (well known binary) are used to encode and transfer this info.
* GeoJSON - JSON based
* GML - XML based 



Geodetic location - latitude and longitude information (precise point on the earth)

Cartographic transformations - 
Geodetic computations - 

 
## Tools

* 
* Python - fiona, geopandas
* Geotools (Java) - http://docs.geotools.org/latest/userguide/tutorial/quickstart/intellij.html
* Openlayers (Mashup Tool) - https://openlayers.org/en/latest/examples/

