# import MASS library
library(MASS)
# show the types and their corresponding number (214 values in total)
table(fgl$type)
# check the classes of types
levels(fgl$type)

# duplicate the fgl set for every working set
myfgl1<-myfgl2<-myfgl3<-myfgl4<-myfgl5<-myfgl6<-fgl
# store all the set in a list to convenient later process
datasetlist<-list(myfgl1,myfgl2,myfgl3,myfgl4,myfgl5,myfgl6)
# store all the selected items in a list
item<-list(1,2,3,4,5,6)

# for loop to process every dataset
for (i in 1:length(datasetlist)){
  # add "other" in the levels in each dataset
  datasetlist[[i]]$type<-factor(datasetlist[[i]]$type,c(levels(fgl$type),"other"))
  # logical separation, all the items with selected type are TRUE, the others are FALSE
  item[[i]]<-(datasetlist[[i]]$type==levels(fgl$type)[i])
  # set all the items whose type is not selected type as "other"
  datasetlist[[i]][!item[[i]],]$type="other"
  # remove the rest of levels, only contain the selected type and "other"
  datasetlist[[i]]$type<-factor(datasetlist[[i]]$type,c(levels(fgl$type)[i],"other"))
  # print each of the set, check the types
  print(datasetlist[[i]]$type)
}
