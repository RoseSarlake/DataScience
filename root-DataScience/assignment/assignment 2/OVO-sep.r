# import MASS library
library(MASS)
library(class)
# show all the tpyes (6 in all)
table(fgl$type)
# set seed as 20
set.seed(20)
# select each type from the dataset
item1<-(fgl$type==levels(fgl$type)[1])
item2<-(fgl$type==levels(fgl$type)[2])
item3<-(fgl$type==levels(fgl$type)[3])
item4<-(fgl$type==levels(fgl$type)[4])
item5<-(fgl$type==levels(fgl$type)[5])
item6<-(fgl$type==levels(fgl$type)[6])
# for every two types, build a new set with only two classes (n*(n-1)/2 = 6*5/2= 15 sets)
set1 = rbind(fgl[item1,],fgl[item2,])
set2 = rbind(fgl[item1,],fgl[item3,])
set3 = rbind(fgl[item1,],fgl[item4,])
set4 = rbind(fgl[item1,],fgl[item5,])
set5 = rbind(fgl[item1,],fgl[item6,])
set6 = rbind(fgl[item2,],fgl[item3,])
set7 = rbind(fgl[item2,],fgl[item4,])
set8 = rbind(fgl[item2,],fgl[item5,])
set9 = rbind(fgl[item2,],fgl[item6,])
set10 = rbind(fgl[item3,],fgl[item4,])
set11 = rbind(fgl[item3,],fgl[item5,])
set12 = rbind(fgl[item3,],fgl[item6,])
set13 = rbind(fgl[item4,],fgl[item5,])
set14 = rbind(fgl[item4,],fgl[item6,])
set15 = rbind(fgl[item5,],fgl[item6,])
# for each set, remove other levels out of the selected two sets
set1$type<-factor(set1$type,c(levels(fgl$type)[1],levels(fgl$type)[2]))
set2$type<-factor(set2$type,c(levels(fgl$type)[1],levels(fgl$type)[3]))
set3$type<-factor(set3$type,c(levels(fgl$type)[1],levels(fgl$type)[4]))
set4$type<-factor(set4$type,c(levels(fgl$type)[1],levels(fgl$type)[5]))
set5$type<-factor(set5$type,c(levels(fgl$type)[1],levels(fgl$type)[6]))
set6$type<-factor(set6$type,c(levels(fgl$type)[2],levels(fgl$type)[3]))
set7$type<-factor(set7$type,c(levels(fgl$type)[2],levels(fgl$type)[4]))
set8$type<-factor(set8$type,c(levels(fgl$type)[2],levels(fgl$type)[5]))
set9$type<-factor(set9$type,c(levels(fgl$type)[2],levels(fgl$type)[6]))
set10$type<-factor(set10$type,c(levels(fgl$type)[3],levels(fgl$type)[4]))
set11$type<-factor(set11$type,c(levels(fgl$type)[3],levels(fgl$type)[5]))
set12$type<-factor(set12$type,c(levels(fgl$type)[3],levels(fgl$type)[6]))
set13$type<-factor(set13$type,c(levels(fgl$type)[4],levels(fgl$type)[5]))
set14$type<-factor(set14$type,c(levels(fgl$type)[4],levels(fgl$type)[6]))
set15$type<-factor(set15$type,c(levels(fgl$type)[5],levels(fgl$type)[6]))

# choose samples from the dataset, the size is half of the data set
dat<-sample(nrow(fgl),nrow(fgl)/2,replace = FALSE)
# select all rows except last row(type) as training set
set1.train = set1[,-10]
set2.train = set2[,-10]
set3.train = set3[,-10]
set4.train = set4[,-10]
set5.train = set5[,-10]
set6.train = set6[,-10]
set7.train = set7[,-10]
set8.train = set8[,-10]
set9.train = set9[,-10]
set10.train = set10[,-10]
set11.train = set11[,-10]
set12.train = set12[,-10]
set13.train = set13[,-10]
set14.train = set14[,-10]
set15.train = set15[,-10]
# build knn to prodict
model1<-knn(na.omit(set1.train[dat,]),
            na.omit(set1.train[-dat,]),
            na.omit(set1$type[dat]),k=7,prob = TRUE)
model2<-knn(na.omit(set2.train[dat,]),
            na.omit(set2.train[-dat,]),
            na.omit(set2$type[dat]),k=7,prob = TRUE)
model3<-knn(na.omit(set3.train[dat,]),
            na.omit(set3.train[-dat,]),
            na.omit(set3$type[dat]),k=7,prob = TRUE)
model4<-knn(na.omit(set4.train[dat,]),
            na.omit(set4.train[-dat,]),
            na.omit(set4$type[dat]),k=7,prob = TRUE)
model5<-knn(na.omit(set5.train[dat,]),
            na.omit(set5.train[-dat,]),
            na.omit(set5$type[dat]),k=7,prob = TRUE)
model6<-knn(na.omit(set6.train[dat,]),
            na.omit(set6.train[-dat,]),
            na.omit(set6$type[dat]),k=7,prob = TRUE)
model7<-knn(na.omit(set7.train[dat,]),
            na.omit(set7.train[-dat,]),
            na.omit(set7$type[dat]),k=7,prob = TRUE)
model8<-knn(na.omit(set8.train[dat,]),
            na.omit(set8.train[-dat,]),
            na.omit(set8$type[dat]),k=7,prob = TRUE)
model9<-knn(na.omit(set9.train[dat,]),
            na.omit(set9.train[-dat,]),
            na.omit(set9$type[dat]),k=7,prob = TRUE)
model10<-knn(na.omit(set10.train[dat,]),
            na.omit(set10.train[-dat,]),
            na.omit(set10$type[dat]),k=7,prob = TRUE)
model11<-knn(na.omit(set11.train[dat,]),
            na.omit(set11.train[-dat,]),
            na.omit(set11$type[dat]),k=7,prob = TRUE)
model12<-knn(na.omit(set12.train[dat,]),
            na.omit(set12.train[-dat,]),
            na.omit(set12$type[dat]),k=7,prob = TRUE)
model13<-knn(na.omit(set13.train[dat,]),
            na.omit(set13.train[-dat,]),
            na.omit(set13$type[dat]),k=7,prob = TRUE)
model14<-knn(na.omit(set14.train[dat,]),
            na.omit(set14.train[-dat,]),
            na.omit(set14$type[dat]),k=7,prob = TRUE)
model15<-knn(na.omit(set15.train[dat,]),
            na.omit(set15.train[-dat,]),
            na.omit(set15$type[dat]),k=7,prob = TRUE)
# show the results of all the models
t1<-table(model1,set1$type[-dat])
t2<-table(model2,set2$type[-dat])
t3<-table(model3,set3$type[-dat])
t4<-table(model4,set4$type[-dat])
t5<-table(model5,set5$type[-dat])
t6<-table(model6,set6$type[-dat])
t7<-table(model7,set7$type[-dat])
t8<-table(model8,set8$type[-dat])
t9<-table(model9,set9$type[-dat])
t10<-table(model10,set10$type[-dat])
t11<-table(model11,set11$type[-dat])
t12<-table(model12,set12$type[-dat])
t13<-table(model13,set13$type[-dat])
t14<-table(model14,set14$type[-dat])
t15<-table(model15,set15$type[-dat])
#compare the "winner" of each model,and return the name of that set
win1<-rownames(t1)[which.max(t1)]
win2<-rownames(t2)[which.max(t2)]
win3<-rownames(t3)[which.max(t3)]
win4<-rownames(t4)[which.max(t4)]
win5<-rownames(t5)[which.max(t5)]
win6<-rownames(t6)[which.max(t6)]
win7<-rownames(t7)[which.max(t7)]
win8<-rownames(t8)[which.max(t8)]
win9<-rownames(t9)[which.max(t9)]
win10<-rownames(t10)[which.max(t10)]
win11<-rownames(t11)[which.max(t11)]
win12<-rownames(t12)[which.max(t12)]
win13<-rownames(t13)[which.max(t13)]
win14<-rownames(t14)[which.max(t14)]
win15<-rownames(t15)[which.max(t15)]
# store all the "winners" together
wins=c(win1,win2,win3,win4,win5,win6,win7,win8,win9,win10,win11,win12,win13,win14,win15)
# find the most frequent class
names(table(wins))[as.vector(table(wins))==max(table(wins))]
