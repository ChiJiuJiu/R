#因子
status <- c("Poor", "Improved", "Excellent", "Poor")
status <- factor(status, ordered = TRUE)

#指定顺序
status <- factor(status, order = TRUE, levels = c("Poor", "Improved","Excellent"))
status

#数据框变因子
pId <- c(1, 2, 3, 4)
AmdData <- c("10/15/2019", "11/01/2009", "10/21/2009", "10/28/2009")
age <- c(25, 34, 28, 52)
db <- c("Type1", "Type2", "Type1", "Type1")
status <- c("Poor", "Improved", "Excellent", "Poor")
pd <- data.frame(pId, AmdData, age, db, status, stringsAsFactors = FALSE)

status <- factor(status, order = TRUE, levels = c("Poor", "Improved","Excellent"))
pd <- data.frame(pId, AmdData, age, db, status, stringsAsFactors = FALSE)
str(pd)
db <- factor(db)
str(db)
str(pd)

#数据类型
#1.字符型
a <- "字符型"
a.a.a <- "字符型2"

a
a.a.a

#检验数据类型
is.character(a.a.a)
mode(a.a.a)

#2.数字型
b <- 5.7
is.numeric(b) #检验是否数字型

#3.整数型
c <- 50
is.integer(c) #该方法有bug，返回FALSE
is.numeric(c) #返回TRUE
c <- as.integer(c) #类型转化
is.integer(c) #返回TRUE

#4.逻辑型
d <- TRUE
is.logical(d) #返回TRUE

#5.复数型
e <- 5 + 7i
is.complex(e) #返回TRUE




#从键盘输入数据
mydata <- data.frame(age = numeric(0), gender = character(0), weight = numeric(0))
mydata <- edit(mydata)
mydata

#grade <- read.table("")#填文件路径
#grade

#加标注
names(pd)[2] <- "year"
pd


#一些函数
length(pd)

dim(z) #查看维度， z是2*3*4的数组

str(pd) #查看结构

names(pd) #查看名字

ls() #查看对象
aa <- 10
lm(aa) #删除对象aa

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
#手动输入数据
leadership <- edit(leadership)
leadership