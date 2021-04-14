# exercise 5 bootstrap

B<-100
size<- nrow(mtcars)
coefs<-rep(0,B)
for(i in 1:B){
    boot.set<-mtcars[sample(size,size,replace = TRUE),]
    coefs[i]<- mean(boot.set$disp)
}
mean.coef<-mean(coefs)
print(mean.coef)
se<- sqrt((1/(B-1))*sum((coefs-mean.coef)^2))
print(se)


coef(lm(hp~disp+wt,mtcars))[2]
coef(lm(hp~disp+wt,boot.set))[2]

#<----------correction----------->

B<-100
nrows<-nrow(mtcars)
coefs<-rep(0,B)
for (i in 1:B) {
  boot.set<-mtcars[sample(nrows,nrows,replace=TRUE),]
  model<-lm(hp~disp+wt,data=boot.set)
  coefs[i]<-coef(model)[2]
}
mean.coef<-mean(coefs)
se<-sqrt( (1/(B-1)) * sum( (coefs-mean.coef)^2 )   )
print(se)

model<-lm(hp~disp+wt,data=mtcars)
summary(model)

B<-100
x<-rnorm(1000,mean=4,sd=3)
size<-length(x)
coefs<-rep(0,B)
for (i in 1:B) {
  boot.set<-x[sample(size,size,replace=TRUE)]
  coefs[i]<-mean(boot.set)
}
mean.coef<-mean(coefs)
se<-sqrt( (1/(B-1)) * sum( (coefs-mean.coef)^2 )   )
print(se)

print(sd(x)/sqrt(size))

library(boot)
boot.fn<-function(data,indices) {
  mean(data[indices])
}
boot(x,boot.fn,B)

