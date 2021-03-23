library(MASS)
library(ROCR)
library(class)
library(DMwR2)
set.seed(2)
biopsy2<-na.omit(biopsy)
#make "malignant" as the positive class
biopsy2$class<- factor(biopsy2$class,c("malignant","benign"))
#Each of nine attributes has been scored on a scale of 1 to 10

names<-names(biopsy2)
scaled<-data.frame(biopsy2[,1],scale(biopsy2[,c(-1,-11)]),biopsy2[,11])
biopsy2<-scaled
names(biopsy2)<-names

train<-sample(nrow(biopsy2),nrow(biopsy2)/2,replace = FALSE)
train.set<-biopsy2[train,-1]
test.set<-biopsy2[-train,-1]

#prior probability for each class
total<-sum(table(biopsy2$class))
prior.prob<- c(table(biopsy2$class)[1]/total,table(biopsy2$class)[2]/total)

#create model and predict labels of test samples
lda.model<-lda(class~.,data = train.set, prior = prior.prob)
lda.pred<-predict(lda.model,newdata=test.set)

adapted.pred<-lda.pred$posterior[,1]#probability of positive class
#ROCR requirement lowest level −−>negative class
adapted.labels<-ifelse(test.set$class=="benign",0,1)