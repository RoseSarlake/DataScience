# OVO method

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
# sample the dataset in case the datasaet is orderd
train<- sample(length(dataset$origin),length(dataset$origin)/2,replace=FALSE)
# seperate the train set and test set
# the 9th var - name should be excluded
train.set<-dataset[train,c(-9)]
test.set<-dataset[-train,c(-9)]
# for different origin, give the corresponding name
American = levels(factor(dataset$origin))[1]
European = levels(factor(dataset$origin))[2]
Japanese = levels(factor(dataset$origin))[3]
# select each type from the dataset
item1<-(train.set[,8]==American)
item2<-(train.set[,8]==European)
item3<-(train.set[,8]==Japanese)
# for every two types, build a new set with only two classes (n*(n-1)/2 = 3*2/2= 3 sets)
set1v2 = rbind(train.set[item1,],train.set[item2,])
set1v3 = rbind(train.set[item1,],train.set[item3,])
set2v3 = rbind(train.set[item2,],train.set[item3,])
# for each set, remove other levels out of the selected two sets
set1v2$origin<-factor(set1v2$origin,c(American,European))
set1v3$origin<-factor(set1v3$origin,c(American,Japanese))
set2v3$origin<-factor(set2v3$origin,c(European,Japanese))

# test those three models using lda

# set 1v2
total1<-sum(table(set1v2$origin))
prior.prob1<- c(table(set1v2$origin)[1]/total1,table(set1v2$origin)[2]/total1)
lda.model1<-lda(origin~.,data = set1v2, prior = prior.prob1)
lda.pred1<-predict(lda.model1,newdata=test.set)
adapted.pred1<-lda.pred1$posterior[,1]#probability of positive class
# "1" for positive values
adapted.labels1<-ifelse(test.set$origin=="1",1,0)

# set 1v3
total2<-sum(table(set1v3$origin))
prior.prob2<- c(table(set1v3$origin)[1]/total2,table(set1v3$origin)[2]/total2)
lda.model2<-lda(origin~.,data = set1v3, prior = prior.prob2)
lda.pred2<-predict(lda.model2,newdata=test.set)
adapted.pred2<-lda.pred2$posterior[,1]
# "2" for negative values
adapted.labels2<-ifelse(test.set$origin=="2",0,1)

# set 2v3
total3<-sum(table(set2v3$origin))
prior.prob3<- c(table(set2v3$origin)[1]/total3,table(set2v3$origin)[2]/total3)
lda.model3<-lda(origin~.,data = set2v3, prior = prior.prob3)
lda.pred3<-predict(lda.model3,newdata=test.set)
adapted.pred3<-lda.pred3$posterior[,1]
# "3" for negative values
adapted.labels3<-ifelse(test.set$origin=="3",0,1)

# function to plot the figure
asessModel<-function(adpted.pred,adapted.labels)
{
  pred<-prediction(adpted.pred,adapted.labels)
  plot(performance(pred,'tpr','fpr'))
  #print(performance(pred,'tpr','fpr'))
  auc<-performance(pred,measure = "auc")
  print(attr(auc,"y.values")[[1]])
  #TPR, FPR and cutoff values
  print(performance(pred, measure = "tpr" )@y.values [[1]])
  print(performance(pred, measure = "fpr" )@y.values [[1]])
  print(performance(pred,'tpr','fpr') @alpha.values [[1]])
  print("-------------")
}
# plot all the three models
asessModel(adapted.pred1,adapted.labels1)
asessModel(adapted.pred2,adapted.labels2)
asessModel(adapted.pred3,adapted.labels3)

