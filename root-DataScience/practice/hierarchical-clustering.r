data (iris)
i.iris <- iris [,1:4]
# Look at dist () help for " method " values
h.complete <- hclust (dist(i.iris), method ="complete")
h.average <- hclust (dist(i.iris), method ="average")
h.single <- hclust (dist(i.iris), method ="single")
par (mfrow =c(1,3))
plot (h.complete, main ="Complete Linkage")
plot (h.average, main ="Average Linkage")
plot (h.single, main ="Single Linkage")
cutree (h.complete,2)
# Redo the clustering and plots after scaling the data
i.iris <-scale(i.iris)
