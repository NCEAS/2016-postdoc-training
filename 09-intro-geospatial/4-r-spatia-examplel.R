# Quick survey of a few R spatial capabilities
#
# packages used:
#  - sp, rgdal, raster, rgeos, maptools

#
# rgdal package
#

#install.packages('rgdal')
library(rgdal)

# set working directory
setwd("/Users/mccullough/Documents/postdoc-training/09-intro-geospatial")

# get info about shapefile
ogrInfo("toads/naamp/naamp.shp", "naamp")

# load points shapefile into R (SpatialPointsDataFrame)
naamp <- readOGR("toads/naamp/naamp.shp", "naamp")
# ...look at what this created...
str(naamp)
#View(naamp@data) #opens attribute table of shapefile naamp

# quick and dirty plot of the points
plot(naamp)
plot(naamp, axes=TRUE)

# read in the polygon waterbody data
nwi <- readOGR("toads/nwi/nwi.shp", "nwi")

# note that if you had a_data_frame with e.g. decimal degree coordinates
# in columns called "lat" and "lon", you can use this statement to
# convert the data frame to a SpatialPointsDataFrame
#coordinates(a_data_frame) <- c("lon", "lat")

# reproject naamp to lat/lon WGS84 ("geographic projection")
naamp.ll <- spTransform(naamp, CRS("+proj=longlat"))

# Plot original naamp shapefile and reprojected version for comparison
par(mfrow=c(2,1)) # creates panel plot
plot(naamp, axes=TRUE)
plot(naamp.ll, axes=TRUE)

# use a few sp package functions...

# calculate inter-point distance matrix
naamp.distances <- spDists(naamp)

#
# simple raster package example
#

#install.packages('raster')
library(raster)

# load land cover raster (R doesn't actually load data until it needs to, later!)
lc <- raster("toads/nlcd2006/nlcd.tif")

# see here for nlcd codes:
#   http://www.mrlc.gov/nlcd06_leg.php

# plot developed areas (codes 21-24) red, everything else white
par(mfrow=c(1,1)) # revert to single plot view
plot(!lc %in% 21:24, legend=FALSE, col=c("red", "white"), main='Developed Areas')

# get cell values corresponding to each point
extract(lc, naamp)

# get cell values corresponding to cells within 100m of each point
extract(lc, naamp, buffer=100) #spatial unit of naamp is m (learned via typing naamp in command prompt)

# get cell values corresponding to cells within each waterbody polygon
# (for the first 10 waterbodies, otherwise it takes a while!)
extract(lc, nwi[1:10, ])

#
# rgeos package
#

#install.packages('rgeos')
library(rgeos)

# create polygons buffering each point by 1km, then unioning all
# generated polygons together
naamp.1km <- gBuffer(naamp, width=1000) #spatial unit of naamp is m (learned via typing naamp in command prompt)

# create polygons buffering each point by 1km, but now with separate
# buffer polygons for each point
# note: more quadsegs = better precision, but bigger resulting files
naamp.1km <- gBuffer(naamp, width=1000, byid=TRUE, quadsegs=24) #quadsegs=number of line segments used to approximate quarter circle
# do a double check on the resulting area! (should be ~1000)
round(sqrt(gArea(naamp.1km, byid=TRUE)/pi))

# add original naamp data, and write to shapefile
naamp.1km <- SpatialPolygonsDataFrame(naamp.1km, data=naamp@data)
writeOGR(naamp.1km, ".", "naamp.1km", driver="ESRI Shapefile", overwrite_layer = T)

# combine rgeos and raster package functions:
# plot land cover cropped to area within 500m of first naamp point
plot(crop(lc, gBuffer(naamp[1, ], width=500)))
points(naamp[1,], pch=16, col="blue", cex=2)

#
# maptools, for fun
#

#install.packages('maptools')
library(maptools)

# determine time of sunset today, at each point
santa.barbara <- SpatialPoints(matrix(c(-119.6972, 34.4208), nrow=1),
    proj4string=CRS("+proj=longlat +datum=WGS84"))
sunriset(santa.barbara, Sys.time(), "sunrise", POSIXct.out=TRUE)
sunriset(santa.barbara, Sys.time(), "sunset", POSIXct.out=TRUE)
