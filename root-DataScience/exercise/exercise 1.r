# 1.- Create a linear regression model using the women dataset. The response variable is: weight 
linear.model1<- lm(weight~height,data=women)
summary(linear.model1)
plot(linear.model1)

# 2.- Create a linear regression model using the rock dataset. The response variable is: area
linear.model2<- lm(area~peri,data=rock)
linear.model2<- lm(area~I(peri^2),data=rock)
linear.model2<- lm(area~perm,data=rock)
summary(linear.model2)
plot(linear.model2)

# 3.- Create a linear regression model using the pressure dataset. The response variable is: pressure 
linear.model3<- lm(pressure~temperature,data=pressure)
summary(linear.model3)
plot(linear.model3)

# 4.- Using the mtcars dataset, display a table on the console with the name, horsepower and number of cylinders of the cars with a horsepower value higher than the mean
mtcars[c("hp","cyl")] [which(mtcars$hp >= mean(mtcars$hp)),]