# knn method

# load the workspace
load("D:/MOMO/Erasmus/UGR/study/DS-Data Science/assignment/morecars.Rdata")
# load the library MASS
library(MASS)
# load the library for multiclass.roc
library(pROC)
# set seed
set.seed(10)
# check if there are missing values
sum(is.na(MoreCars))
# exclude the missing values
dataset <- na.omit(MoreCars)
# choose half as the training model
train<- sample(length(dataset$origin),length(dataset$origin)/2,replace=FALSE)
# set the training and testing models and scale, the first 7 variables are used
train.set<-scale(dataset[train,c(1:7)], center = TRUE, scale = TRUE)
test.set<-scale(dataset[-train,c(1:7)], center = TRUE, scale = TRUE)
#build the knn model
model.knn<-knn (train.set,test.set,dataset$origin[train],k=7,prob=TRUE) 
# the factor of ground truth
truth<-factor(dataset$origin[-train])
# the confusion table
t<-table (model.knn,truth)
# due to there are 3 classes, the multiclass.roc is used
roc.multi<-multiclass.roc(truth, as.numeric(model.knn), percent=TRUE)
# rocs stores individual roc curve info for each classes
rs <- roc.multi[['rocs']]
# plot the first
plot.roc(rs[[1]])
# plot the other two in the same figure
sapply(2:length(rs),function(i) lines.roc(rs[[i]],col=i))
