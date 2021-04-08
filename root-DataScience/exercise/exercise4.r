# exercise4 K-fold

# 5-fold cross validation, k=5
k<-5
# check the number of sample in mtcars
nrows<- nrow(mtcars)   # sample = 32
# the size of each group is 32/5 = 6.4
# some groups is 6, the others are 7 
# let the first two be7, 7+7+6+6+6=32
# regular size is 6
reg.size<-floor(nrows/k)
# take the remainder
remain<- nrows %% reg.size

data.set<-mtcars[sample(nrows,replace = F),]

groups<-vector()
for (i in 1:k){
  elems<-reg.size
  # if there's remain, the current group number is 1 higher than the regular size
  if (remain>0){
    elems<- elems+1
    remain<- remain-1
  }
  groups<- append(groups,rep(i,elems))
}

# 5 rounds test+train
test.sets <- vector(mode = "list", length = 5)
train.sets<- vector(mode = "list", length = 5)
for (i in 1:k) {
  test.sets[[i]]<-data.set[groups==i,]
  train.sets[[i]]<-data.set[groups!=i,]
}

# check the length
nrow(test.sets[[1]]) #7
nrow(train.sets[[1]])#25

nrow(test.sets[[3]])#6
nrow(train.sets[[3]])#26
