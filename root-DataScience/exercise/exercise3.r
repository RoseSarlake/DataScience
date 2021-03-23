library(smotefamliy)
library(ISLR)
#library(ROSE)
#set.seed(2)
train<-sample(nrow(Default),nrow(Default)/2,replace = FALSE)
#ratio<-length(which(Default[train,]$default=="No"))/length(which(Default[train,]$default=="Yes"))
#dosmote<-SMOTE(default~.-student,data=Default[train,],perc.over=ratio*100,perc.under=100)
smoted2<-SMOTE(Default[train,c("balance","income")],Default[train,"default"])
#length(which(dosmote$default=='No'))
#length(which(dosmote$default=='Yes'))
table(smoted2$data$class)

train.set<-Default[train,]
t<-table(train.set$default)
diff<-t[1]-t[2]
minority.class<-train.set[train.set$default=="Yes"]
selected<-sample(nrow(train.set),replace = TRUE)
oversample.set<-rbind(train.set,minority.class[selected,])