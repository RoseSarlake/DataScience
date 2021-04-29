library(class)
data(iris)
library(tree)
iris.tree<-tree(Species~.,iris)
plot(iris.tree)
text(iris.tree)

iris.train<- sample(1:nrow(iris),100)
iris.test<- iris[-iris.train,]
iris.test.Species<- iris.test[,"Species"]

#iris.tree<-rpart(Species~.,iris,subset = iris.train)
tree.pred <- predict(iris.tree,iris.test,type = "class")
table(tree.pred,iris.test.Species)

library(rattle)
library(rpart)
fancyRpartPlot(iris.tree)
