set.seed(2)

glm.fit<- glm(hp~disp,data = mtcars)
cv<-cv.glm(mtcars,glm.fit,K=5)
cv$delta[1]

glm.fit<- glm(hp~disp+I(disp^2),data = mtcars)
cv<-cv.glm(mtcars,glm.fit,K=5)
cv$delta[1]

glm.fit<- glm(pressure~temperature,data = pressure)
cv<-cv.glm(pressure,glm.fit,K=5)
cv$delta[1]
glm.fit<- glm(pressure~temperature+I(temperature^2),data = pressure)
cv<-cv.glm(pressure,glm.fit,K=5)
cv$delta[1]