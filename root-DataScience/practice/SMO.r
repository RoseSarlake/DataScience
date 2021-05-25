library(RSNNS)
data(iris)
iris<- iris[sample(1:nrow(iris),length(1:nrow(iris))),1:ncol(iris)]
irisValues <- iris [, 1:4]
irisTargets <- iris [, 5]

model <-som(irisValues, mapX = 16, mapY = 16, maxit = 500, targets = irisTargets)
plotActMap(model$map, col = rev(heat.colors(12))) 

plotActMap(log(model$map + 1), col = rev(heat.colors(12))) 
persp(1:model$archParams$mapX, 1:model$archParams$mapY, log(model$map + 1), 
             theta = 30, phi = 30, expand = 0.5, col = "lightblue") 
plotActMap(model$labeledMap)
