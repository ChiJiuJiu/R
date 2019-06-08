#因子
database <- c("type1", "type2", "type1", "type1")
database <- factor(database)
#矩阵
y <- matrix(1:20, nrow = 5, ncol = 4) #5行4列的矩阵
#数组
z <- array(1:24, c(2, 3, 4))
#列表
g <- "list"
h <- c(1, 2, 3, 4)
j <- matrix(1:10, nrow = 5)
mylist <- list(title = g, h, j)

#编程题目
#文件位置
fileName <- 'D:/数据分析与R语言/R/考试/成绩.csv'
#数学满分600
set.seed(1)
Math <- round(runif(50, 1, 600), 2)
Math
#English满分60
set.seed(2)
English <- round(runif(50, 1, 60), 2)
English
#java分数满分100
set.seed(3)
Java <- round(runif(50, 1, 100), 2)
Java
#语文满分150
set.seed(4)
Chinese <- round(runif(50, 1, 150), 2)
Chinese
#体育满分150
set.seed(5)
Sports <- round(runif(50, 1, 150), 2)
Sports
#id生成
id <- rep(1:50)
#名字, 手动输入
name <- c()
#创建数据框
myGrade <- data.frame(id, Math, English, Java, Chinese, Sports)
#去行名写入文件
write.csv(myGrade, fileName, row.names = FALSE)
#手动添加name后重新导入
myTable <- read.csv(fileName, header = TRUE)
#抽取10行观测
set.seed(6)
attach(myTable)
newTable <- myTable[sample(1:50, 10, replace = FALSE), ]
newTable
detach(myTable)
#自定义标准化函数
fun <- function(x){
  x <- as.numeric(x)
  return ((x - min(x)) / (max(x) - min(x)))
}
#进行标准化
newTable$Math <- fun(newTable$Math) 
newTable$English <- fun(newTable$English)
newTable$Java <- fun(newTable$Java)
newTable$Chinese <- fun(newTable$Chinese)
newTable$Sports <- fun(newTable$Sports)
#求均值
newTable <- transform(newTable, average = apply(newTable[, 3: 7], 1, mean))
#评分
#分位点
quantile <- quantile(newTable$average, c(0.8, 0.6, 0.4, 0.2))
newTable <- within(newTable, {
  score <- NA
  score[average >= quantile["80%"]] <- "优"
  score[average >= quantile["60%"] & average < quantile["80%"]] <- "良"
  score[average < quantile["60%"] & average >= quantile["40%"] ] <- "中"
  score[average < quantile["40%"] & average >= quantile["20%"] ] <- "差"
  score[average < quantile["20%"]] <- "非常差"
})

#根据姓排序
orderByName <- newTable[order(newTable$name), ]


#画图
x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12)
plot(x, xlab = "x", ylab = "y", main = "cex and font", ylim = c(1, 7), pch = 21, cex = c(1, 2, 3, 4, 5, 6, 7))










