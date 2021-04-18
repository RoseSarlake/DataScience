library(glmnet)
x<- model.matrix(hp~.-1,mtcars) # NO intercept
y<- mtcars[,"hp"]

grid <- 10^seq(10,-2,length = 100)
ridge.fit<-glmnet(x,y,alpha = 0, lambda = grid) # alpha=0 =>ridge

options(digits = 2)
coef(ridge.fit)[,1]
coef(ridge.fit)[,100]

#----------
train<-sample(1:nrow(mtcars),nrow(mtcars)/2)
test <- (-train)
cv.out <- cv.glmnet(x[train,],y[train],alpha=0,nfolds=5)  # alpha 0 => Ridge regression, alpha 1 => Lasso regression
best.lambda<-cv.out$lambda.min
prediction<-predict(ridge.fit,s=best.lambda,newx = x[test,])
mean((prediction-y[test])^2)
#refit on the full dataset
ridge.fit.final<- glmnet(x,y,alpha = 0)  # do not pass lambda here as parameter. alpha = 0/1
predict(ridge.fit.final,s=best.lambda,type="coefficients")
