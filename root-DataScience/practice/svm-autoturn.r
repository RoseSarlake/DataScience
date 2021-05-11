library(e1071)
set.seed(2)
x<- matrix(rnorm(200*2),ncol = 2)
x[1:100,]<-x[1:100,]+2
x[101:150,]<-x[101:150,]-2
y<- c(rep(1,150),rep(2,50))
dat<- data.frame(x=x,y=as.factor(y))
plot(x, col = y)

train<- sample(200,100)
svmfit<-svm(y~.,data = dat[train,],kernel="radial",gamma = 1, cost = 1)
plot(svmfit,dat[train,])
summary(svmfit)

svmfit2<-svm(y~.,data = dat[train,],kernel="radial",gamma = 1, cost = 1e5)
plot(svmfit2,dat[train,])

svmfit3<-svm(y~.,data = dat[train,],kernel="radial",gamma = 2, cost = 1)
plot(svmfit3,dat[train,])
svmfit4<-svm(y~.,data = dat[train,],kernel="radial",gamma = 5, cost = 1)
plot(svmfit4,dat[train,])

# auto-turning
tune.out<- tune(svm,y~.,data = dat[train,],kernel = "radial",
                ranges = list(cost = c(0.1,1,10,100,1000),gamma = c(0.5,1,2,3,4)))
summary(tune.out)
table(true = dat[-train,"y"],pred = predict(tune.out$best.model, newdata = dat[-train,]))
