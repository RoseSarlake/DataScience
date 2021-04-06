# import MASS library
library(MASS)
library(class)
# set seed as 20
set.seed(20)
# show all the tpyes (6 in all)
table(fgl$type)
# store the selected items in a list
item<-list(1,2,3,4,5,6)
# select each type from the dataset
for (i in 1:length(item)){
  item[[i]]<-(fgl$type==levels(fgl$type)[i])
}
# initialize the 15 sets with 0 in a list
sets<-as.list(rep(0,15))
# give loop index of sets
times <- 1
# make pairs set
for (i in 1:(length(item)-1)){
    for (j in (i+1):length(item)){
      # for every two types, build a new set with only two classes (n*(n-1)/2 = 6*5/2= 15 sets)
      sets[[times]] = rbind(fgl[item[[i]],],fgl[item[[j]],])
      # for each set, remove other levels out of the selected current two sets
      sets[[times]]$type <- factor(sets[[times]]$type,c(levels(fgl$type)[i],levels(fgl$type)[j]))
      times <- times+1
  }
}
# choose samples from the dataset, the size is half of the data set
dat<-sample(nrow(fgl),nrow(fgl)/2,replace = FALSE)
# store the training set in a list, initialize it as 0
sets.train<-as.list(rep(0,15))
# store the models in a list, initialize it as 0
models<- as.list(rep(0,15))
# store the result table, initialize it as 0
t<- as.list(rep(0,15))
# store the "winner" of each set, initialize it
wins<- vector(mode="character", length=15)
# final store the result as a vector 
for (i in 1:length(sets)){
  sets.train[[i]]<-sets[[i]][,-10]
  models[[i]]<-knn(na.omit(sets.train[[i]][dat,]),
              na.omit(sets.train[[i]][-dat,]),
              na.omit(sets[[i]]$type[dat]),k=7,prob = TRUE)
  t[[i]]<-table(models[[i]],sets[[i]]$type[-dat])
  wins[i]<-rownames(t[[i]])[which.max(t[[i]])]
}
# find the most frequent class among all the results in every set
names(table(wins))[as.vector(table(wins))==max(table(wins))]
