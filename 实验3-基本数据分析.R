rm(teenagers)
#创建teenagers数据框
studentid <- c(1,2,3,4,5,6,7,8)
date <- c("06/30/06","06/30/06","06/30/06","06/30/07","06/30/07","06/30/07","06/30/08","06/30/09")
gender <- c("M","F","M","F","M","F","F","M")
age <- c(18,18,17,18,16,19,15,70)
friends <- c(7,0,69,0,10,142,72,17)
item1 <- c(0,1,0,1,0,0,1,0)
item2 <- c(0,1,1,0,0,0,0,1)
item3 <- c(0,0,0,0,1,0,1,0)
item4 <- c(0,0,1,0,0,0,NA,1)
item5 <- c(0,1,0,1,0,1,NA,0)
teenagers <- data.frame(studentid,date,gender,age,friends,item1,item2,item3,item4,item5,stringsAsFactors = FALSE)
fix(teenagers)
#使用rbind()函数添加行
#方法1
 #teenagers <- data.frame(studentid,date,gender,age,friends,item1,item2,item3,item4,item5,stringsAsFactors = FALSE)
studentid <- c(9,10)
date <- c("06/30/06","06/30/08")
gender <- c("F","F")
age <- c(15,12)
friends <- c(52,39)
item1 <- c(0,1)
item2 <- c(0,0)
item3 <- c(0,1)
item4 <- c(0,NA)
item5 <- c(0,NA)
newteenagers <- data.frame(studentid,date,gender,age,friends,item1,item2,item3,item4,item5,stringsAsFactors = FALSE)
teenagers <- rbind(teenagers,newteenagers)

str(teenagers)  #查看数据类型

#创建新变量interest_sum
#方法1
teenagers$interest_sum <- teenagers$item1+teenagers$item2+teenagers$item3+teenagers$item4+teenagers$item5

#方法2
teenagers <- transform(teenagers,interest_sum=item1+item2+item3+item4+item5)

#重命名
#方法1
fix(teenagers)  
#方法2
#install.packages("Rcpp")
#install.packages("plyr")
library(Rcpp)
library(plyr)
teenagers <- rename(teenagers,c(date="graddate",item1="basketball",item2="football",item3="socce",item4="softball",item5="volleyball"))


#重编码
teenagers$age[teenagers$age==70] <- NA
teenagers$agecat
teenagers$agecat[teenagers$age < 15] <- "junior"
teenagers$agecat[teenagers$age >= 15 & teenagers$age <= 20] <- "senior"

#删除不完整的行
newdata <- na.omit(teenagers)

#日期类型转化

myformat <- "%m/%d/%y"
teenagers$graddate <- as.Date(teenagers$graddate,myformat)

#计算毕业天数
startdate <- as.Date("2006-06-30")
is.character(startdate)
enddate <- Sys.Date()
days <- enddate-startdate

#筛选数据
#方法1
newdata1 <- teenagers[,6:7]
#方法2
myvars <- c("basketball","football")
newdata11 <- teenagers[myvars]
#方法3
newdata111 <- teenagers[,c("basketball","football")]

#下标操作
#筛选1 前5行数据
newdata2 <- teenagers[1:5,]

#筛选2 性别为女，年龄大于15
newdata3 <- teenagers[which(teenagers$gender == "F" & teenagers$age > 15),]

#筛选3  年龄大于15小于19
newdata4 <- subset(teenagers,age>15 & age<19)

#随机抽取数据
mysample <- teenagers[sample(1:nrow(teenagers),5,replace = TRUE),]
rm(mysample)

#使用SQL语句操作数据框 找出性别为男的数据，按照朋友数据排序
 #install.packages("sqldf")
library(sqldf)
newdf <- sqldf("select * from teenagers where gender='M' order by friends",row.names(TRUE))

#name <- "Bob"
#cat( "Hello", name, "\b.\n", "Isn\'t R", "\t", "GREAT?\n")


