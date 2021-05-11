# multiple classes
set.seed(2)
data(iris)
svmi<- svm(Species~., data = iris, kernel = "linear",cost = 10)
svmi.predict <- predict(svmi, data = iris, type  = "class")
table(svmi.predict,iris$Species)

svmii<- svm(Species~., data = iris, kernel = "radial",cost = 10)
svmii.predict <- predict(svmii, data = iris, type  = "class")
table(svmii.predict,iris$Species)