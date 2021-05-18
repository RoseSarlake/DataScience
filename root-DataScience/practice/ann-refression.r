library(class)
library(MASS)
library(nnet)

data(Boston)
train<-sample(1:nrow(Boston),nrow(Boston)/2)
nn.boston<-nnet(medv~.,data = Boston, subset = train, size = 3)
summary(nn.boston)
# logistic, result between 0 and 1
nn.boston.predict.train <- predict(nn.boston,Boston[train,])

# use linear output
nn.boston<-nnet(medv~.,data = Boston, subset = train,size=3, linout = TRUE)
nn.boston<-nnet(medv~.,data = Boston, subset = train,size=8, linout = TRUE)
nn.boston.predict.train <- predict(nn.boston,Boston[train,])

sqrt(mean(nn.boston.predict.train - Boston[train,"medv"])^2)

nn.boston.predict.test <- predict(nn.boston,Boston[-train,])
sqrt(mean(nn.boston.predict.test - Boston[-train,"medv"])^2)