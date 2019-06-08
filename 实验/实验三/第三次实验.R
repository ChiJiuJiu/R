#一、使用mtcars数据集
#1.打印前六行数据
head(mtcars)
#2.获取mpg，hp，wt的描述性统计量(至少使用3种方法)
myvars <- c("mpg","hp","wt")
#方法一
summary(mtcars[myvars])
#方法二
sapply(mtcars[myvars], mean) 
#方法三
install.packages("Hmisc")
library(Hmisc)
describe(mtcars[myvars])

#二、使用vcd包中的Arthritis数据集
#1.打印前六行数据
install.packages("vcd")
library(vcd)
head(Arthritis)
#2.生成一维和二维列联表（使用你能想到的方法）
#一维列联表
mytable <- with(Arthritis,table(Improved))
#二维列联表
mytable <- xtabs(~ Treatment+Improved, data=Arthritis)

#三、使用state.x77数据集
#1.打印前六行数据
head(state.x77)
#2.计算前六列数据的协方差矩阵和相关系数
states<- state.x77[,1:6]
#协方差矩阵
cov(states)
#相关系数
cor(states)

