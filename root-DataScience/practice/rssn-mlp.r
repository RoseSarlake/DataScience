library(RSNNS)
iris <-  iris[sample(1:nrow(iris) ,length(1:nrow(iris))), 1:ncol(iris)] 
irisValues <-  iris[,1:4] 
irisTargets <- iris[,5] 
irisDecTargets <-  decodeClassLabels(irisTargets) 
iris <-  splitForTrainingAndTest(irisValues, irisDecTargets, ratio = 0.15) 
iris <-  normTrainingAndTestSet(iris)

model <-  mlp(iris$inputsTrain, iris$targetsTrain, size = 5, learnFuncParams = c(0.1), maxit = 60, inputsTest = iris$inputsTest, targetsTest = iris$targetsTest) 
predictions <-  predict(model, iris$inputsTest)

plotIterativeError(model) 
plotRegressionError(predictions[,2], iris$targetsTest[,2], pch = 3) 
plotROC(fitted.values(model)[,2], iris$targetsTrain[,2]) 
plotROC(predictions[,2], iris$targetsTest[,2])

confusionMatrix(iris$targetsTrain, fitted.values(model))
confusionMatrix(iris$targetsTest, predictions)
confusionMatrix(iris$targetsTrain, encodeClassLabels(fitted.values(model), method = "402040", l = 0.4, h = 0.6))

parameterGrid <-  expand.grid(c(3,5,9,15), c(0.00316, 0.0147, 0.1))
colnames(parameterGrid)  <- c("nHidden", "learnRate")
rownames(parameterGrid)  <- paste("nnet-", apply(parameterGrid, 1, function(x) {paste(x,sep="", collapse="-")}), sep="")
models  <- apply(parameterGrid, 1, function(p) {
  mlp(iris$inputsTrain, iris$targetsTrain, size=p[1], learnFunc="Std_Backpropagation", 
      learnFuncParams=c(p[2], 0.1), maxit=200, inputsTest=iris$inputsTest, 
      targetsTest=iris$targetsTest) 
})

par(mfrow=c(4,3)) 
for(modInd in 1:length(models)) { 
  plotIterativeError(models[[modInd]], main=names(models)[modInd]) 
}


trainErrors <-  data.frame(lapply(models, function(mod) { 
  error <- sqrt(sum((mod$fitted.values - iris$targetsTrain)^2)) 
  error 
})) 

testErrors <-  data.frame(lapply(models, function(mod) { 
  pred <-  predict(mod,iris$inputsTest) 
  error <-  sqrt(sum((pred - iris$targetsTest)^2)) 
  error 
})) 

t(trainErrors)
t(testErrors)

trainErrors[which(min(trainErrors) == trainErrors)]
testErrors[which(min(testErrors) == testErrors)]

model <- models[[which(min(testErrors) == testErrors)]]

model

summary(model)
