# Intro to geospatial

# Demystifying _spatial_

* We all work with a variety of data
    - Table of trait means for different plants
    - Matrix of species presence/absence by site
    - Time series of flow volume at a river gauge
* Geospatial data are data too!
    - ...but they happen to have:
        - info about geographic locations of observations
        - info about spatial relationships among them
    - ...and therefore we can:
        - visualize the data in map form ("layers")
        - combine data based on shared location
        - Do analyses that exploit spatial relationships

# Digital representations of spatial data

# 1. Vector data

* Conceptually, a set of discrete objects
* Simplified representation:
    - Points (rain gauges, animal capture locations)
    - Lines (continuous transects, streams, roads)
    - Polygons (watersheds, patches, species ranges)
* Each 'object' can have multiple attributes (e.g., a road has length, number of lanes, speed limit)
* Topology _may_ be explicit and enforced
    - linear networks, polygon adjacency

# 2. Raster data

* Conceptually, a 'field' view of the world
* Simplified representation
    - Regular grid, typically one value per cell ("pixel")
    - e.g. satellite imagery, digital terrain, interpolated surfaces
* Each pixel usually has a single-valued attribute
    - binary, categorical, continuous, etc
* Topology is implicitly defined


# Map projections

* Representing the 3D (spheroid) Earth in 2D
    - Imagine flattening a ping-pong ball

* Why?
    - Printing on paper
    - Viewing on screen
    - Many calculations are faster/simpler

=> All projections involves distortion!! see [here](https://en.wikipedia.org/wiki/Tissot%27s_indicatrix#/media/File:Tissot_world_from_space.png) for a nice example.

# Map projections

![](images/threepro.gif)

# Map projections

* Choice of projection involves trade-offs
    - Preserve shape? Or area?
    - Over what map extent?
* Also need to choose coordinate system
    - Where is the origin?
    - What are the units?

# Map projections

![](images/coordinate.gif
    "http://www.gpsfield.com/principle/images/coordinate.gif")

* Data don't _**need**_ to be projected
    - "Geographic projection": latitude-longitude
    - Computers aren't constrained to 2D!
    - ...but in practice, most software apps are limited

# Dealing with projections

* You need to know the projection of your data!
* Changing projections:
    - Some software (e.g., ArcGIS) can project "on the fly"
        - convenient, but can cause confusion
    - Software for reprojection
    - Vector: trivial
    - Raster: can involve "warping"

# Geodetic Datums

#### Where is lat 34.419, lon -119.699?

![](images/datum.gif "Lumpy Earth")

* We can't just model earth as a sphere
    - to Ellipsoid: squashed, spheroidal shape
    - to Geoid: lumpy surface, even at mean sea level
    - (for now, ignore real topography)

# Geodetic Datums

**Datum**: Links coordinates on a reference geoid with actual locations
on earth

* WGS84 (World Geodetic System 1984), NAD83 (N. American Datum 1983) both common
    - Align to within 1m of each other
    - Both are based on GRS80 (Geodetic Reference System 1980)
* Older spatial data may use older datums
* Local datums provide more accuracy in given place
    - but probably more than you'll ever need!

* **Caution**: Interpreting location using the wrong datum can result
  in positional error of up to 100s of meters!

# Using the wrong datum
WGS84 vs. NAD27
![](images/wgs84-vs-nad27.png)


# Coordinate Reference Systems (CRS)

Not only there is myriad of projections, there are also different formats to define them, and different softwares use different notations:

This site is a very good reference about the different projection formats:
http://epsg.io/ 

Note that a coordinate reference system can be identified by unique Spatial Reference System Identifier (SRID), sometimes also referenced as EPSG (European Petroleum Survey Group, from the consortium name that first started to compile this database):
- WGS84: SRID 4326
- NAD83: SRID 4269 

#### => *Search for WGS84, the standard projectin used in GPS*.

# Spatial Resolution
- There are 



# Data storage formats

* Considerable variation in terms of
    - Portability (open standard? proprietary?)
    - Compression type and storage size
    - Flexibility
    - Ability to embed metadata

# Data storage formats -- vectors

> * **ESRI Shapefile**: multi-file format
* **KML**: XML-based format popularized by Google
* **ESRI Personal GeoDatabase**: extends Access databases (ick!)
* CSV??? (at least for point data with XY coordinates...)
* [many other lesser known](http://www.gdal.org/ogr_formats.html)

# Data storage formats -- rasters

> * **ASCII grid**: text matrix with header rows
* **GeoTIFF**: binary image format with geo metadata
* **Arc/Info binary grid**: proprietary binary format, multi-file
* **NetCDF**: flexible container for array data
* _**many others**_: img, bil, grib, [lots more](http://www.gdal.org/formats_list.html)

## References

- list of map projection: https://en.wikipedia.org/wiki/List_of_map_projections
- Intro from ESRI on coordinate systems: http://resources.esri.com/help/9.3/arcgisengine/dotnet/89b720a5-7339-44b0-8b58-0f5bf2843393.htm 
- Overview of CRS in R: https://www.nceas.ucsb.edu/~frazier/RSpatialGuides/OverviewCoordinateReferenceSystems.pdf
- More about the PROJ.4 format: https://trac.osgeo.org/proj/wiki/GenParms