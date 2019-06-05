#创建新变量
mydata <- data.frame(x1 = c(2, 2, 6, 4), x2 = c(3, 4, 2, 8))
mydata

sumx = mydata$x1 + mydata$x2

#给数据框中添加新变量
#方法一
mydata$sumx = mydata$x1 + mydata$x2
mydata$meanx = (mydata$x1 + mydata$x2) / 2
mydata

#方法二
attach(mydata)
mydata$sumx = x1 + x2
mydata$meanx = (x1 + x2) / 2
detach(mydata)
mydata

rm(mydata)
#方法三
mydata <- transform(mydata, sumx = x1 + x2, meanx = (x1 + x2) / 2)
mydata


#变量重编码
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
#重新编码
#方法一
leadership$age[leadership$age == 99] <- NA
leadership$agecat[leadership$age > 65] <- "Elder"
leadership$agecat[leadership$age <= 65 & leadership$age > 39] <- "Middle age"
leadership$agecat[leadership$age <= 39] <- "Young"
#方法二
leadership <- within(leadership, {
  agecat <- NA
  agecat[age > 65] <- "Elder"
  agecat[age <= 65 & age >39] <- "Middle age"
  agecat[age <= 39] <- "Young"
  agecat[age == 99] <- NA
})


#变量的重命名
#方法一
fix(leadership)

#方法二
#先导包
install.packages("plyr")
#载入内存
library(plyr)
#重命名
leadership <- rename(leadership, c(data = "testdate"))
#打印所有变量名
names(leadership)

#方法三
names(leadership)[2] <- "date"
names(leadership)[6:10] <- c("item1", "item2", "item3", "item4", "item5")

#缺失值
y <- c(1, 2, 3, NA)
is.na(y) #返回结果：FALSE FALSE FALSE  TRUE
is.na(leadership[, 6:10])

#NA求和
x <- c(1, 2, NA, 3)
z <- sum(x)
#除去缺失值求和
y <- sum(x, na.rm = TRUE)

#除去所有缺失值(有缺失值的行都删除)
newdata <- na.omit(leadership)


