library()
data(USArrests)
states<- row.names(USArrests)
names(USArrests)
apply(USArrests,2,mean)
apply(USArrests,2,var)
# principle component
pr.out <- prcomp(USArrests,scale = TRUE)# average 0
names(pr.out)

pr.out$center
pr.out$scale
pr.out$rotation

biplot(pr.out, scale = 0)

pr.out$sdev
pr.var <- pr.out$sdev^2
pve<- pr.var/sum(pr.var)
plot(pve,xlab = "principal component",ylab = "proportion of variance explained", ylim = c(0,1), type = "b")
# adding the later 
plot(cumsum(pve),xlab = "principal component",ylab = "proportion of variance explained", ylim = c(0,1), type = "b")
