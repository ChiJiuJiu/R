# 一个示例：创建数据框
manager <- c(1,2,3,4,5)
date <- c("10/24/08","10/28/08","10/1/08","10/12/08","5/1/09")
country <- c("US","US","UK","UK","UK")
gender <- c("M","F","F","M","F")
age <- c(32,45,25,39,99)
q1 <- c(5,3,3,3,2)
q2 <- c(4,5,5,3,2)
q3 <- c(5,2,5,4,1)
q4 <- c(5,5,5,NA,2)
q5 <- c(5,5,2,NA,1)
leadership <- data.frame(manager,date,country,gender,age,q1,q2,q3,q4,q5, 
                         stringsAsFactors=FALSE)

#一、y创建新变量
mydata <- data.frame(x1=c(2,2,6,4),x2=c(3,4,2,8))
mydata

mydata$sumx = mydata$x1 + mydata$x2
mydata$meanx = (mydata$x1 + mydata$x2)/2

attach(mydata)
mydata$sumx = x1 + x2
mydata$meanx = (x1 + x2)/2
detach(mydata)
mydata
rm(mydata)

mydata <- transform(mydata,sumx = x1 + x2,meanx = (x1 + x2)/2)
mydata

#二、变量的重编码
leadership$age[leadership$age==99] <- NA
leadership$agecat[leadership$age > 65] <- "Elder"
leadership$agecat[leadership$age <= 65 & leadership$age > 39] <- "Middle age"
leadership$agecat[leadership$age <= 39] <- "Young"
rm(leadership)

leadership <- within(leadership,{
  agecat <- NA
  agecat[age > 65] <- "Elder"
  agecat[age <= 65 & age > 39] <- "Middle age"
  agecat[age <= 39] <- "Young"
  agecat[age == 99] <- NA
}
)

#三、变量的重命名
fix(leadership)
leadership

install.packages("plyr")
library(plyr)
leadership <- rename(leadership,c(date = "testdate"))

names(leadership)
names(leadership)[2] <- "date"
names(leadership)[6:10] <- c("item1","item2","item3","item4","item5")
rm(leadership)

y <- c(1,2,3,NA)
is.na(y)
is.na(leadership[,6:10])

x <- c(1,2,NA,3)
z <- sum(x)
y <- sum(x,na.rm = TRUE)
y

newdata <- na.omit(leadership)
newdata

#四、关于日期类型
strDates <- c("01/05/1965", "08/16/1975")
dates <- as.Date(strDates, "%m/%d/%Y")

Sys.Date()
date()

startdate <- as.Date("1999-01-01")
enddate <- Sys.Date()
days <- startdate - enddate
difftime(enddate,startdate,units = "weeks")

today <- Sys.Date()
format(today,"%B %d %Y")
format(today,"%A")

today <- as.character(today)
is.character(today)

#五、数据类型的转化

a <- c(1,2,3)
is.numeric(a)
is.vector(a)

a <- as.character(a)
is.numeric(a)
is.vector(a)
is.character(a)


#六、排序
newdata <- leadership[order(leadership$age),]
newdata

attach(leadership)
newdata1 <- leadership[order(gender,age),]
newdata1
detach(leadership)

attach(leadership)
newdata2 <- leadership[order(gender,-age),]
newdata2
detach(leadership)



newdata2 <- leadership[order(leadership$gender,decreasing = T),]
newdata2
a1 <- newdata2[1:2,]
a2 <- newdata2[3:5,]
a1
a2
a1 <- a1[order(a1$age),]
a2 <- a2[order(a2$age),]
a1
a2
newdata2 <- rbind(a1,a2)


#七、数据集的合并
 # 1、案列合并

manager <- c(1,2,3,4,5)
date <- c("10/24/08","10/28/08","10/1/08","10/12/08","5/1/09")
country <- c("US","US","UK","UK","UK")
gender <- c("M","F","F","M","F")
age <- c(32,45,25,39,99)
dataframeA <- data.frame(manager,date,country,gender,age, 
                         stringsAsFactors=FALSE)
manager <- c(1,2,3,4,5)
q1 <- c(5,3,3,3,2)
q2 <- c(4,5,5,3,2)
q3 <- c(5,2,5,4,1)
q4 <- c(5,5,5,NA,2)
q5 <- c(5,5,2,NA,1)

dataframeB <- data.frame(manager,q1,q2,q3,q4,q5, 
                         stringsAsFactors=FALSE)

total <- merge(dataframeA, dataframeB, by="manager")



x <- matrix(1:9,nrow = 3, ncol = 3)
x

y <- matrix(10:18,nrow = 3)
y

z <- cbind(x,y)
z


z1 <- rbind(x,y)
z1



#八、数据集取子集

#选取列
newdata <- leadership[ ,c(6:10)]
newdata

newdata <- leadership[c("q1","q2","q3","q4","q5")]
newdata

myvars <- paste("q",1:5,sep = "")
myvars
newdata <- leadership[myvars]

myvars <- names(leadership)%in%c("q1","q2","q3","q4","q5")
myvars
newdata <- leadership[myvars]
#丢弃列
myvars <- names(leadership)%in%c("q3","q4")
myvars
newdata <- leadership[!myvars]

newdata <- leadership[c(-8,-9)]

leadership$q3 <- leadership$q4 <- NULL
leadership
#选取行
newdata <- leadership[1:3,]
newdata

newdata <- leadership[leadership$gender == "M" & leadership$age > 30,]
  
attach(leadership)
newdata <- leadership[gender == "M" & age > 30,]
newdata
detach(leadership)

newdata <- leadership[which(leadership$age > 10 & leadership$age < 50),]

#既选取行又选取列
newdata <- subset(leadership,age >= 35|age < 24,select = c(age,q1,q2,q3,q4))
newdata <- subset(leadership,age >= 35|age < 24,select = q1:q5)

#随机抽样
x <- sample(1:nrow(leadership), 3, replace=FALSE)
x
mysample <- leadership[x,]
mysample 

#使用SQL语句操作 
install.packages("sqldf")
library(sqldf)

mtcars
str(mtcars)
newdf <- sqldf("select * from mtcars where carb=1 order by mpg",
               row.names=TRUE)
newdf


  