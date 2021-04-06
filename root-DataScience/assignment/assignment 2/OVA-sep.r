# import MASS library
library(MASS)
# show the types and their corresponding number (214 values in total)
table(fgl$type)
# check the classes of types
levels(fgl$type)

#<----------1. Winf and other---------->
# duplicate the fgl as current working dataset (first)
myfgl1<-fgl
# add "other" in the levels
myfgl1$type<-factor(myfgl1$type,c(levels(fgl$type),"other"))
# logical separation, all the items with type "WinF" are TRUE, the others are FALSE
item1<-(myfgl1$type==levels(myfgl1$type)[1])
# set all the items whose type is not "WinF" as "other"
myfgl1[!item1,]$type="other"
# remove the rest of levels, only contain the "WinF" and "other"
myfgl1$type<-factor(myfgl1$type,c(levels(fgl$type)[1],"other"))

#<----------2. WinNF and other---------->
# duplicate the fgl as current working dataset (second)
myfgl2<-fgl
# add "other" in the levels
myfgl2$type<-factor(myfgl2$type,c(levels(fgl$type),"other"))
# logical separation, all the items with type "WinNF" are TRUE, the others are FALSE
item2<-(myfgl2$type==levels(myfgl2$type)[2])
# set all the items whose type is not "WinNF" as "other"
myfgl2[!item2,]$type="other"
# remove the rest of levels, only contain the "WinNF" and "other"
myfgl2$type<-factor(myfgl2$type,c(levels(fgl$type)[2],"other"))

#<----------3. Veh and other---------->
# duplicate the fgl as current working dataset (third)
myfgl3<-fgl
# add "other" in the levels
myfgl3$type<-factor(myfgl3$type,c(levels(fgl$type),"other"))
# logical separation, all the items with type "Veh" are TRUE, the others are FALSE
item3<-(myfgl3$type==levels(myfgl3$type)[3])
# set all the items whose type is not "Veh" as "other"
myfgl3[!item3,]$type="other"
# remove the rest of levels, only contain the "Veh" and "other"
myfgl3$type<-factor(myfgl3$type,c(levels(fgl$type)[3],"other"))

#<----------4. Con and other---------->
# duplicate the fgl as current working dataset (fourth)
myfgl4<-fgl
# add "other" in the levels
myfgl4$type<-factor(myfgl4$type,c(levels(fgl$type),"other"))
# logical separation, all the items with type "Con" are TRUE, the others are FALSE
item4<-(myfgl4$type==levels(myfgl4$type)[4])
# set all the items whose type is not "Con" as "other"
myfgl4[!item4,]$type="other"
# remove the rest of levels, only contain the "Con" and "other"
myfgl4$type<-factor(myfgl4$type,c(levels(fgl$type)[4],"other"))

#<----------5. Tabl and other---------->
# duplicate the fgl as current working dataset (fifth)
myfgl5<-fgl
# add "other" in the levels
myfgl5$type<-factor(myfgl5$type,c(levels(fgl$type),"other"))
# logical separation, all the items with type "Tabl" are TRUE, the others are FALSE
item5<-(myfgl5$type==levels(myfgl5$type)[5])
# set all the items whose type is not "Tabl" as "other"
myfgl5[!item5,]$type="other"
# remove the rest of levels, only contain the "Tabl" and "other"
myfgl5$type<-factor(myfgl5$type,c(levels(fgl$type)[5],"other"))

#<----------6. Head and other---------->
# duplicate the fgl as current working dataset (sixth)
myfgl6<-fgl
# add "other" in the levels
myfgl6$type<-factor(myfgl6$type,c(levels(fgl$type),"other"))
# logical separation, all the items with type "Head" are TRUE, the others are FALSE
item6<-(myfgl6$type==levels(myfgl6$type)[6])
# set all the items whose type is not "Head" as "other"
myfgl6[!item6,]$type="other"
# remove the rest of levels, only contain the "Head" and "other"
myfgl6$type<-factor(myfgl6$type,c(levels(fgl$type)[6],"other"))

