# 1.- Create a linear regression model using the women dataset. The response variable is: weight 
linear.model1<- lm(weight~height,data=women)

linear.model1<- lm(weight~.-1,data=women)
summary(linear.model1)

linear.model1<- lm(weight~I(height^2),data=women)
plot(linear.model1)

# --predict--
train <- sample(1:nrow(women),nrow(women)/2,replace = FALSE) #(not replace, no duplicate)
linear.model1<- lm(weight~I(height^2),data=women[train,])
prediction <- predict(linear.model,newdata = women[-train,]) #(not select the trained data)
mean(prediction -women[-train,2])^2 #(calculate the error)

# 2.- Create a linear regression model using the rock dataset. The response variable is: area
linear.model2<- lm(area~.,data=rock) #use all
linear.model2<- lm(area~peri,data=rock)
linear.model2<- lm(area~.-shape-1.,data=rock) # delete shape
linear.model2<- lm(area~I(peri^2),data=rock)
linear.model2<- lm(area~perm,data=rock)

linear.model2<- lm(area~(peri+perm)^2-1,data=rock)
summary(linear.model2)
plot(linear.model2)

# 3.- Create a linear regression model using the pressure dataset. The response variable is: pressure 
linear.model3<- lm(pressure~temperature,data=pressure)
linear.model3<- lm(pressure~.+I(temperature^2)+I(temperature^3)-1,data=pressure)
linear.model3<- lm(pressure~.+I(temperature^2)++I(temperature^3)++I(temperature^4)++I(temperature^5)-1,data=pressure)

summary(linear.model3)
plot(linear.model3)

# 4.- Using the mtcars dataset, display a table on the console with the name, horsepower and number of cylinders of the cars with a horsepower value higher than the mean
mtcars[c("hp","cyl")] [which(mtcars$hp >= mean(mtcars$hp)),]
#another solution
mtcars[mtcars$hp>mean(mtcars$hp),c("hp","cyl")]