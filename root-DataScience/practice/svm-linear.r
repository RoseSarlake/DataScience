library(e1071)
set.seed(2)
# random dataset
x<- matrix(rnorm(20*2),ncol=2)
y<-c(rep(-1,10),rep(1,10))
x[y==1,]<-x[y==1,]+1
plot(x, col=(3-y))
# create data frame with factor class attribute
dat<- data.frame(x=x,y=as.factor(y))
svmfit<- svm(y~., data = dat,kernel = "linear",cost = 10, scale = FALSE)
plot(svmfit,dat)     
svmfit$index
summary(svmfit)
