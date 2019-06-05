#一、数据结构
#向量
a <- c(1,2,3,4,5,-6)
b <- c("one","two","three")
c <- c(TRUE,FALSE,TRUE,FALSE)

a[3]
a[2:5]
a[-3]
a[c(1,3,5)]

#矩阵
rnames <- c("R1","R2","R3","R4","R5")
cnames <- c("C1","C2","C3","C4")

y <- matrix(1:20,nrow = 5,ncol=4,byrow = TRUE,dimnames = list(rnames,cnames))
y

y[2,]
y[2,3]
y[,3]
y[2,c(2,4)]

#数组
d1 <- c("A1","A2")
d2 <- c("B1","B2","B3")
d3 <- c("C1","C2","C3","C4")

z <- array(1:24,c(2,3,4),dimnames = list(d1,d2,d3))
z

z[1,1,]
z[1,1,2]
z[1, ,]

#数据框
pID1 <- c(1,2,3,4)
AmdData <- c("10/15/2019","11/01/2009","10/21/2009","10/28/2009")
age <- c(25,34,28,52)
db <- c("Type1","Type2","Type1","Type1")
str(db)
db <- factor(db)
status <- c("Poor","Improved","Excellent","Poor")
status <- factor(status,order = TRUE,levels = c("Poor","Improved","Excellent"))
str(status)
pd <- data.frame(pID1,AmdData,age,db,status,stringsAsFactors = FALSE)
str(pd)

pd[1:2,]
pd[1,2]
pd[c("age","pID")]

attach(pd)
pID2
detach(pd)
mtcars

#列表
g <- "my first list"
h <- c(25,25,18,39)
j <- matrix(1:10,nrow = 5)
k <- c("one","two","three")
mylist <- list(title=g,age=h,j,k)
mylist

mylist[[2]]
mylist[["age"]]
mylist$age[2]

#因子
status <- c("Poor","Improved","Excellent","Poor")
status <- factor(status)
status <- factor(status,order = TRUE)
status <- factor(status,order = TRUE,levels = c("Poor","Improved","Excellent"))
status

#二、数据类型
#1、字符型
a <- "hahahahaha"
a.a.a <- "hahahaha"
is.character(a.a.a)
mode(a.a.a)

#2、数字型
b <- 5.7
is.numeric(b)

#3、整数型
c <- 50
is.integer(c)
is.numeric(c)
c <- as.integer(c)
is.integer(c)

#4、逻辑型
d <- TRUE
is.logical(d)

#5、复数型
e <- 5 + 7i
e
is.complex(e)

#6、特殊的类型：缺失值和空值
f <- NA
is.na(f)
g <- c(NA,2,5,NULL)

#从键盘录入数据
mydata <- data.frame(age = numeric(0),gender =  character(0),weight = numeric(0))
mydata <- edit(mydata)
mydata

#读入文本文件
grade <- read.table("D:\\实施\\2019盐城师范\\山东女子\\R语言\\R代码\\2创建数据集\\test.csv")
grade
getwd()

test <- read.table("pt_data.csv",header = TRUE,sep = ",")
test

write.csv(pd,file = "test.csv")

#加标注
names(pd)[2] <- "year"
pd

#其他使用函数
length(pd)
dim(z)
str(pd)
names(pd)
tail(mtcars)
ls()
rm(z)
ls()
