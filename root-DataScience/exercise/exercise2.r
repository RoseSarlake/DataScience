library(MASS)
library(ISLR)
set.seed(3)
train<-sample(length(iris$Species),length(iris$Species)/2,replace=FALSE)
lda.model<-lda(Species~.,data=iris,subset = train)   
summary(lda.model)
lda.pred<-predict(lda.model,newdata=iris[-train,])
table(lda.pred$class,iris[-train,]$Species)

totalSamples<-nrow(iris)
train<- sample(totalSamples,totalSamples/2,replace = FALSE)
test <- -train

lda.model<-lda(Species~.,data=iris, subset=train)
prediction<-predict(lda.model,newdata=iris[test,])
table(prediction$class,iris[test,]$Species)