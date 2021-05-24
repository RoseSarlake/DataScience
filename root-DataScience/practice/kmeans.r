set.seed(2)
x <- matrix(rnorm(50*2), ncol = 2)
x[1:25,1] <- x[1:25,1]+3
x[1:25,2] <- x[1:25,2]-4

km.out <- kmeans(x,2,nstart = 20)
km.out$cluster
plot(x,col = (km.out$cluster+1), main = "K Means clustering results with K =2",
     xlab = "", ylab = "", pch = 20, cex = 2)

set.seed(4)
km.out2 <- kmeans(x,3, nstart = 20)
km.out2

set.seed(4)
km.out3 <- kmeans(x,3, nstart = 1)
km.out3$tot.withinss
km.out4 <- kmeans(x,3, nstart = 20)
km.out4$tot.withinss
plot(x,col = (km.out3$cluster+1), main = "K Means clustering results with K =2",
     xlab = "", ylab = "", pch = 20, cex = 2)
plot(x,col = (km.out4$cluster+1), main = "K Means clustering results with K =2",
     xlab = "", ylab = "", pch = 20, cex = 2)
