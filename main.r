# 1.- Create a vector containing the first 10 odd natural numbers and number 2 as last element.
print("—————————NO.1—————————")
x1 <- c(seq (from =1, to =20, by=2),2)
print(x1)

# 2.- Create a function called is.odd. This function should return TRUE if the argument is odd. Hint: %% is the the module operator in R. 
print("—————————NO.2—————————")
is_odd <- function(num) {
  if (num %% 2 == 1) {
    return(TRUE)
  }else{
    print("This is not odd")
  }
}
x2 <- is_odd(3)
print(x2)
x2 <- is_odd(4)

# 3.-Create a function that computes the mean of the elements stored at odd positions in a vector. Apply it to the vector of exercise 1.
print("—————————NO.3—————————")
com_odd_mean <- function (elem){
  n <- length(elem)
  mean(elem[seq(n) %% 2 == 1])
}
x3 <- com_odd_mean(x1)
print(x3)

# 4.- Create a data frame where each column will be generated using the vector of exercise 1 as base. Column i will be generafted using the aforementioned vector incrementing all its elements in i units. The data frame will have 3 columns called a, b and c
print("—————————NO.4—————————")
x4 <- data.frame (a = x1+1,b=x1+2,c=x1+3)
print(x4)

# 5.- Write the code to compute the maximum value of the first 5 elements of the second column and also the maximum value of the first 5 elements of the third column of the data frame of exercise 4
print("—————————NO.5—————————")
x5_1 = max(x4[1:5,2])
print(x5_1)
x5_2 = max(x4[1:5,3])
print(x5_2)

# 6.- Create a 5x6 matrix with elements sampled from a uniform probability distribution on the interval from -2 to 2
print("—————————NO.6—————————")
x6 <- matrix (runif(n=30, min = -2, max = 2) ,nrow=5 ,ncol=6 , byrow=FALSE )
print(x6)

# 7.- Plot each column of the data frame of exercise 4 in red using points, in green using a line and in blue using points on a line. The three plots have to be arranged on the same row.

print("—————————NO.7—————————")
#matplot(cbind(x4$a,x4$b,x4$c),type=c("p","l","b"),col=c("red","green","blue"),lty=c(1,1,1))
plot(x4$c,ylab="value",type="b",col="blue")
lines(x4$b, ylab="value",type="l",col="green")
points(x4$a,ylab="value",type="p",col="red")