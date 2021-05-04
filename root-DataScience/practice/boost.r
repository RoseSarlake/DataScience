library(gbm)
set.seed(2)
data(Boston)
train = sample(1:nrow(Boston), nrow(Boston)/2,replace = FALSE)
boston.test <- Boston[-train,"medv"]
boost.boston <- gbm(medv~.,data = Boston[train,],distribution = "gaussian",
                    n.trees =5000, interaction.depth = 4,shrinkage = 0.2, verbose = FALSE)
summary(boost.boston)

yhat.boost<-predict(boost.boston,newdata = Boston[-train,],n.trees = 5000)
mean((yhat.boost-boston.test)^2)