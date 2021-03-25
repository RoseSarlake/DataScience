library(ISLR)
library(ROCR)
library(class)
library(smotefamily)

set.seed(2)
data.set<-Default
data.set[,2]<-ifelse(data.set[,2]=="No",0,1) #no=0,yes=1
#head(data.set)
#range(data.set$income)
#range(data.set$balance)
names<-names(data.set)
data.set<-data.frame(data.set[,c(1,2)],scale(data.set[,c(2,3)]))
names(data.set)<-names

train<-sample(nrow(data.set),2*nrow(data.set)/3,replace = FALSE)
train.set<-data.set[train,]
test.set<-data.set[-train,]

model<-knn(train.set[,-1],test.set[,-1],train.set$default,k=7,prob=T)
probs<-attr(model,"prob") #prob of the winning class

adapted.probs<-ifelse(model=="No",1-probs,probs) # Probs of "Yes"/ positive
adpated.pred<-adapted.probs
adapted.labels<-test.set$default  # correct values

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
asessModel(adpated.pred,adapted.labels)

