# OVA 1 class from the rest
iris
table(iris$Species)
levels(iris$Species)[1]

currentClassItems<-(iris$Species==levels(iris$Species)[1])
iris$Species<-factor(iris$Species,c(levels(iris$Species),"other"))
iris[!currentClassItems,]$Species="other"
iris$Species<-factor(iris$Species,c(levels(iris$Species)[1],"other"))


currentClassItems<-(iris$Species==levels(iris$Species)[2])
iris$Species<-factor(iris$Species,c(levels(iris$Species),"other"))
iris[!currentClassItems,]$Species="other"
iris$Species<-factor(iris$Species,c(levels(iris$Species)[2],"other"))


currentClassItems<-(iris$Species==levels(iris$Species)[3])
iris$Species<-factor(iris$Species,c(levels(iris$Species),"other"))
iris[!currentClassItems,]$Species="other"
iris$Species<-factor(iris$Species,c(levels(iris$Species)[3],"other"))
