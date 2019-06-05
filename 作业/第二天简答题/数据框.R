#创建数据框
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
#增加变量agecat, 重新编码
leadership$age[leadership$age==99] <- NA
leadership$agecat[leadership$age > 55] <- "Elder"
leadership$agecat[leadership$age <= 50 & leadership$age >= 30] <- "Middle age"
leadership$agecat[leadership$age < 30] <- "Young"
#重命名
names(leadership)[6:10] <- c("item1", "item2", "item3", "item4", "item5")
#增加变量，去缺失值求和
leadership <- transform(leadership, mySum = q1 + q2 + q3 + q4)
leadership <- na.omit(leadership)
leadership
#方法二，逐行求和
testSum <- rowSums(leadership[,6:10])
leadership <- transform(leadership, mySum = rowSums(leadership[,6:10]))
leadership <- na.omit(leadership)