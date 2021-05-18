library(class)
library(nnet)
data(iris)

train<-sample(1:nrow(iris),nrow(iris)/2)
nn.iris<-nnet(Species~.,data = iris, subset = train, size = 3)
summary(nn.iris)

nn.iris.predict.train<-predict(nn.iris,iris[train,],type = "class")
nn.iris.predict.train <- as.factor(nn.iris.predict.train)

table(nn.iris.predict.train,iris[train,"Species"])

nn.iris.predict.test<-predict(nn.iris,iris[-train,],type = "class")
nn.iris.predict.test <- as.factor(nn.iris.predict.test)
table(nn.iris.predict.test,iris[-train,"Species"])