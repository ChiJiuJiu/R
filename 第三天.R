#2019-6-5
#继基本数据管理

#日期类型
strDates <- c("01/05/1965", "08/16/1975")
myData <- as.Date(strDates, "%m/%d/%Y")

#如何得到当天的日期
Sys.Date()
#得到当前的时间和日期,可用于时间的计算
date()

#例子, 计算已经出生了多少天
startdate <- as.Date("1999-03-08")
enddate <- Sys.Date()
days <- enddate - startdate
days
#计算出生多少周
difftime(enddate, startdate, units = "weeks")

#格式化输出
today <- Sys.Date()
format(today, "%B %d %Y %A")
#转化成字符型
as.character(today)

#数据类型的转化
a <- c(1, 2, 3)
is.numeric(a) #TRUE
is.vector(a) #TRUE
a <- as.character(a) #转化为字符型
is.numeric(a) #FALSE
is.vector(a) #TRUE

#数据排序
#创建数据框
manager <- c(1, 2, 3, 4, 5)
data <- c("10/24/08", "10/28/08", "10/1/08", "10/12/08", "5/1/09")
country <- c("US", "US", "UK", "UK", "UK")
gender <- c("M", "F", "F", "M", "F")
age <- c(32, 45, 25, 39, 99)
q1 <- c(5, 3, 3 ,3, 2)
q2 <- c(4, 5, 5, 3, 2)
q3 <- c(5, 2, 5, 4, 1)
q4 <- c(5, 5, 5, NA, 2)
q5 <- c(5, 5, 2, NA, 1)
leadership <- data.frame(manager, data, country, gender, age, q1, q2, q3, q4, q5, stringsAsFactors = FALSE)

#排序
#按年龄排序, 默认升序
newdata <- leadership[order(leadership$age), ]

#按性别升序，年龄降序排序
attach(leadership)
newdata1 <- leadership[order(gender, -age), ]
newdata1
detach(leadership)

#创建学生数据框，包含字段 姓名、年龄、性别、入学日期
id <- c(1, 2, 3)
name <- c("小赵1", "小赵2", "小赵3")
age <- c(20, 21, 20)
sex <- c("M", "F", "M")
birthday <- c("08/03/1999", "08/03/1998", "08/03/1999")
birthday <- as.Date(birthday, "%d/%m/%Y")
schoolDate <- c("07/09/2017", "07/09/2017", "07/09/2017")
schoolDate <- as.Date(schoolDate, "%d/%m/%Y")
students <- data.frame(id, name, age, sex, birthday, schoolDate)

#计算第一个同学出生多少周
difftime(Sys.Date(), students$birthday[1], units = "weeks")

#按照年龄升序排列数据框
sortStudentByAge <- students[order(students$age), ]
sortStudentByAge

#按性别降序，年龄升序排序
attach(students)
sortStudentBySexAndAge <- students[order(sex, decreasing = TRUE, age), ]
detach(students)
sortStudentBySexAndAge

#先划分，再合并
newdata2 <- leadership[order(leadership$gender, decreasing = TRUE), ]
a1 <- newdata2[1:2, ]
a2 <- newdata2[3:5, ]

a1 <- a1[order(a1$age), ]
a2 <- a2[order(a2$age), ]

newdata2 <- rbind(a1, a2)

#数据集的合并
#案例合并
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

#矩阵合并
x <- matrix(1:9,nrow = 3, ncol = 3)
x

y <- matrix(10:18,nrow = 3)
y

#按行合并（合并列，需要有同样的行数）
z <- cbind(x,y)
z

#按列合并(合并行，需要有同样的列数)
z1 <- rbind(x,y)
z1


#数据集取子集
#选取6到10列
#方法一
newdata <- leadership[ ,c(6:10)]
#方法二
newdata <- leadership[c("q1", "q2", "q3", "q4", "q5")]
#方法三
myvars <- paste("q", 1:5, sep = "")
newdata <- leadership[myvars]
#方法四
myvars <- names(leadership)%in%c("q1","q2","q3","q4","q5")
myvars
newdata <- leadership[myvars]

#剔除变量
#丢弃q3、q4列
myvars <- names(leadership)%in%c("q3","q4")
myvars
newdata <- leadership[!myvars]
#丢弃第1和第2列
newdata <- leadership[c(-1,-2)]
#丢弃q3和q4列
leadership$q3 <- leadership$q4 <- NULL
leadership

#取观测（取行）
#找出大于30岁的男人
newdata <- leadership[leadership$gender == "M" & leadership$age >30, ]

attach(leadership)
newdata <- leadership[gender == "M" & age > 30,]
newdata
detach(leadership)


#选行和列，利用subset方法
newdata <- subset(leadership, age >= 35 | age < 24, select = c(age, q1, q2, q3, q4))
#简写
newdata <- subset(leadership, age >= 35 | age < 24, select = c(age, q1:q5))

#which方法
newdata <- leadership[which(leadership$age > 10 & leadership$age < 50),]


#随机抽样
x <- sample(1 : nrow(leadership), 3, replace = FALSE)
mysample <- leadership[x, ]
mysample

#sql语句操作数据框
#下包
install.packages("sqldf")
library(sqldf)
#汽车数据集
mtcars
#row.names = FALSE表示带行号，反之不带行号
newdf <- sqldf("select * from mtcars where carb = 1 order by mpg", row.names = FALSE)

