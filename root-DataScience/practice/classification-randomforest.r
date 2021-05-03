library(class)
library(randomForest)
library(MASS)

set.seed(1)

set <- sample(1:nrow(iris),nrow(iris)/2)
train <- iris[set,c(-5) ]
test <- iris[-set,c(-5)]
iris.pred <- knn(train = scale(train), 
                test  = scale(test),
                cl    = iris[set,5 ],
                k     = 5,
                prob  = TRUE)

truth<-factor(iris$Species[-set])
t1 <- table(iris.pred,truth)

rf.iris<- randomForest(Species~.,data = iris,subset = set, mtry=3,importance=TRUE)
rf.pre<- predict(rf.iris, newdata = iris[-set,])
t2<- table(rf.pre,truth)
