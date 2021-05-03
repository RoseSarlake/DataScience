library(randomForest)
library(MASS)
set.seed(3)
data(Boston)
train<- sample(1:nrow(Boston),nrow(Boston)/2)
boston.test<- Boston[-train,"medv"]

rf.boston<- randomForest(medv~.,data = Boston,subset = train,mtry=7,importance=TRUE)
yhat.rf<- predict(rf.boston, newdata = Boston[-train,])
mean((yhat.rf - boston.test)^2)

importance(rf.boston)
