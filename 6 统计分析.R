#一、描述性统计分析
 #mpg 每加仑英里数 hp马力 wt车重
myvars <- c("mpg","hp","wt")
head(mtcars[myvars])

 #使用summary()函数获取描述性统计量
summary(mtcars[myvars])
 
 #使用sapply()函数计算所选择的任意描述性统计量
mystats <- function(x,na.omit = FALSE){
  if (na.omit)
    x <- x[!is.na(x)]
  m <- mean(x)
  n <- length(x)
  s <- sd(x)
  skew <- sum((x-m)^3/s^3)/n
  kurt <- sum((x-m)^4/s^4)/n - 3
  return(c(n=n, mean=m, stdev=s, skew=skew, kurtosis=kurt))
}

myvars <- c("mpg", "hp", "wt")
sapply(mtcars[myvars], mystats) 

  #更多方法 使用Hmisc包中的describe()函数返回描述性统计量
#install.packages("Hmisc")
library(Hmisc)
describe(mtcars[myvars])

  #更多方法 使用pastecs包中的stat.desc()函数计算描述性统计量
#install.packages("pastecs")
library(pastecs)
myvars <- c("mpg","hp","wt")
stat.desc(mtcars[myvars])

  #更多方法 使用psych包中的describe()函数计算描述性统计量
#install.packages("psych")
library(psych)
myvars <- c("mpg","hp","wt")
describe(mtcars[myvars])
 
 #分组计算描述性统计量
 #使用aggregate()分组获取描述性统计量
myvars <- c("mpg", "hp", "wt")
aggregate(mtcars[myvars], by=list(am=mtcars$am), mean)
aggregate(mtcars[myvars], by=list(am=mtcars$am), sd)

 #使用by()分组计算描述性统计量

dstats <- function(x){sapply(x, mystats)}
myvars <- c("mpg", "hp", "wt")
by(mtcars[myvars], mtcars$am, dstats)

 #扩展 使用psych包中的describeBy()分组计算描述统计量
#library(psych)
myvars <- c("mpg", "hp", "wt")
describeBy(mtcars[myvars], list(am=mtcars$am))

#二、频数表和列联表
install.packages("vcd")
library(vcd)
head(Arthritis)
 #一维列联表
 #使用table()函数生成简单频数统计表
mytable <- with(Arthritis,table(Improved))
#mytable <- table(Arthritis$Improved)
  #使用prop.table()将频数转化为比例值
prop.table(mytable)
mytable
prop.table(mytable)*100

 #二维列联表,使用xtabs()函数
mytable <- xtabs(~ Treatment+Improved, data=Arthritis)
 #使用prop.table()生成各单元所占比例
prop.table(mytable)
 
  #使用margin.table()生成边际频数
margin.table(mytable, 1)
margin.table(mytable, 2)

 #使用prop.table()生成边际比例
prop.table(mytable, 1)
prop.table(mytable, 2)

 #使用addmargins()函数为这些表格添加边际和
addmargins(mytable)
addmargins(prop.table(mytable))
addmargins(prop.table(mytable), 2)
addmargins(prop.table(mytable), 1)

 #使用CrossTable生成二维列联表
#install.packages("gmodels")
#library(gmodels)
#CrossTable(Arthritis$Treatment, Arthritis$Improved)

 #独立性检验
  #卡方独立性检验
  #使用chisq.test()函数对二维表的行变量和列变量进行卡方独立性检验

library(vcd)
mytable <- xtabs(~Treatment+Improved, data=Arthritis)
chisq.test(mytable)
mytable <- xtabs(~Improved+Sex, data=Arthritis)
chisq.test(mytable)

  #assocstats()函数可用来计算二维列联表的phi系数、列联系数和Cramer’s V系数

library(vcd)
mytable <- xtabs(~Treatment+Improved, data=Arthritis)
assocstats(mytable)

#三、相关

 #cor()函数可计算相关系数，cov()函数可用来计算协方差
states<- state.x77[,1:6]
cov(states)
cor(states)
cor(states, method="spearman")
   #非方形相关系数计算
x <- states[,c("Population", "Income", "Illiteracy", "HS Grad")]
y <- states[,c("Life Exp", "Murder")]
cor(x,y)
 #偏相关 指在控制一个或多个定量变量时，另外两个定量变量之间的相互关系
install.packages("igraph")
install.packages("ggm")
library(igraph)
library(ggm)
colnames(states)
pcor(c(1,5,2,3,6), cov(states))

  #相关性显著性检验 使用cor.test()函数对单个的Pearson、Spearman和Kendall相关系数进行检

cor.test(states[,3], states[,5])

   #通过corr.test计算相关矩阵并进行显著性检验 

library(psych)
corr.test(states, use="complete")

# 四、t检验
 #独立样本的t检验
library(MASS)
t.test(Prob ~ So, data=UScrime)

 #非独立样本的t检验
sapply(UScrime[c("U1","U2")], function(x)(c(mean=mean(x),sd=sd(x))))
with(UScrime, t.test(U1, U2, paired=TRUE))

#五、非参数检验
 #两组数据独立 秩和检验
with(UScrime, by(Prob, So, median))
wilcox.test(Prob ~ So, data=UScrime)

 #两组数据不独立 符号检验
sapply(UScrime[c("U1", "U2")], median)
with(UScrime, wilcox.test(U1, U2, paired=TRUE))

 #多于两组的比较
states <- data.frame(cbind(state.region, state.x77))
kruskal.test(Illiteracy ~ state.region, data=states)
 
 #扩展自学
  source("http://www.statmethods.net/RiA/wmc.txt")              
  states <- data.frame(state.region, state.x77)
  wmc(Illiteracy ~ state.region, data=states, method="holm")








  