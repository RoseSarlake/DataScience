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
