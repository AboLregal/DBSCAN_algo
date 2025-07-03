in this simple project , by random data downloaded from TSP problems

The aim is to cluster them using Density-based spatial clustering of applications with noise (DBSCAN) algorithm

first parameters are epsilon (e) & min points (mnpts)
the input data (dat)

by applying the method of dbscan , the output will be cluster indecies (idx) ,a clusters groups (G3)

idx2=dbscan(dat,e,mnpts); this line only works for matlab r2019 a and older versions
