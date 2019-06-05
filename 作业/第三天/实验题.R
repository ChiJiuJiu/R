#(1)
#创建数据框
studentid <- c(1, 2, 3, 4, 5, 6, 7, 8)
date <- c("06/30/06", "06/30/06", "06/30/06", "06/30/07", "06/30/07", "06/30/07", "06/30/08", "06/30/09")
gender <- c("M", "F", "M", "F", "M", "F", "F", "F")
age <- c(18, 18, 17, 18, 16, 19, 15, 70)
friends <- c(7, 0, 69, 0, 10, 142, 72, 17)
item1 <- c(0, 1, 0, 1, 0, 0, 1, 0)
item2 <- c(0, 1, 1, 0, 0, 0, 0, 1)
item3 <- c(0, 0, 0, 0, 1, 0, 1, 0)
item4 <- c(0, 0, 1, 0, 0, 0, NA, 1)
item5 <- c(0, 1, 0, 1, 0, 1, NA, 0)
teenagers <- data.frame(studentid, date, gender, age, friends, item1, item2, item3, item4, item5)
teenagers
#(2)
#增加两行数据
studentid <- c(9, 10)
date <- c("06/30/06", "06/30/08")
gender <- c("F", "F")
age <- c(15, 12)
friends <- c(52, 39)
item1 <- c(0, 1)
item2 <- c(0, 0)
item3 <- c(0, 1)
item4 <- c(0, NA)
item5 <- c(0, NA)
newRows <- data.frame(studentid, date, gender, age, friends, item1, item2, item3, item4, item5)
#增加
teenagers <- rbind(teenagers, newRows)
teenagers

#(3)
#创建新变量
teenagers <- transform(teenagers, interest_sum = item1 + item2 + item3 + item4 + item5)
teenagers

#(4)
install.packages("plyr")
library(plyr)
teenagers <- rename(teenagers, c(date = "graddate"))
names(teenagers)[6:10] <- c("basketball", "football", "socce", "softball", "volleyball")

#(5)
teenagers <- within(teenagers, {
  agecat <- NA
  agecat[age < 15] <- "junior"
  agecat[age <= 20 & age >=15] <- "senior"
  agecat[age == 70] <- NA
})

#(6)
newdata <- na.omit(teenagers)

#(7)
teenagers$graddate <- as.Date(teenagers$graddate, "%m/%d/%y")
#排序
sorted <- teenagers[order(teenagers$graddate), ]
time <- Sys.Date() - teenagers[1, 2]

#(8)
#方法一
teenagers[, c(6:7)]
#方法二
teenagers[c("basketball", "football")]
#方法三
vars <- names(teenagers)%in%c("basketball", "football")
teenagers[vars]

#(9)
newdata2 <- teenagers[1:5, ]

#(10)
newdata3 <- teenagers[teenagers$gender == "F" & teenagers$age > 15, ]

#(11)
newdata4 <- subset(teenagers, age > 15 & age < 19)

#(12)
x <- sample(1 : nrow(teenagers), 5, replace = FALSE)
mysample <- teenagers[x, ]
mysample

#(13)
install.packages("sqldf")
library(sqldf)
newdf <- sqldf("select * from teenagers where gender = 'M' order by friends", row.names = FALSE)
