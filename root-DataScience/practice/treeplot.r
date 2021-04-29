library(class)
library(ISLR)
data(Hitters)
library(tree)

ht<-tree(Salary~Hits+Years,Hitters)
plot(ht)
ht2<-prune.tree(ht,best=3)
plot(ht2)
text(ht2)

ht3<- tree(Salary~.,Hitters)
plot(ht3)
text(ht3)
