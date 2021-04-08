# 5-folds CV
# mtcars
k<-5
nrows<- nrow(mtcars)  #32/5 = 6.4
size<-floor(nrows/k)
rest<- nrows-(size*k)
# 7 7 6 6 6 ==> 32 samples
data.set<-mtcars[sample(nrows,replace = F),]# select 1-32
folds<-vector()
for (i in 1:k){
  elems<-size
  if (rest>0){
    elems<-elems+1
    rest<-rest-1
  }
  folds<- append(folds,rep(i,elems))
}
#another way cut() :7 6 6 6 7
folds2<-cut(seq(1,nrows),breaks=5,labels=FALSE)

#folds2 == folds
test.set<-data.set[folds==1,]
nrow(test.set)
train.set<-data.set[folds!=1,]
nrow(train.set)
test.set2<-data.set[folds==2,]
train.set2<-data.set[folds!=2,]