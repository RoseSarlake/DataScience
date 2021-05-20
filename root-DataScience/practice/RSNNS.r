library(RSNNS)
# load data set
load("D:/MOMO/Erasmus/UGR/study/DS-Data Science/UCI-Datasets.RData")
anndata<- abalone
anndata <-  anndata[sample(1:nrow(anndata) ,length(1:nrow(anndata))), 1:ncol(anndata)] 
anndata$Sex <- as.numeric(anndata$Sex) 

values <-  anndata[,1:8] 
targets <- anndata[,9]  #range(1,29)
targets <-  decodeClassLabels(targets) 


patterns <- splitForTrainingAndTest(values, targets, ratio = 0.2)
patterns <- normTrainingAndTestSet(patterns)
annmodel <- mlp(patterns$inputsTrain, patterns$targetsTrain, 
                  size = c(8), learnFuncParams = c(0.1), maxit = 500, 
                  inputsTest = patterns$inputsTest, targetsTest = patterns$targetsTest)

predictions <- predict(annmodel,patterns$inputsTest)

plotIterativeError(annmodel) 
plotRegressionError(predictions[,2],patterns$targetsTest[,2],pch = 3)
#plotRegressionError(patterns$targetsTrain, annmodel$fitted.values) 
#plotRegressionError(patterns$targetsTest, annmodel$fittedTestValues) 
plotROC(fitted.values(annmodel),patterns$targetsTrain)
plotROC(predictions,patterns$targetsTest)

