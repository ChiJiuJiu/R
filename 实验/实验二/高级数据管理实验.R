#成绩表
fileName <- 'D:/数据分析与R语言/R/实验/实验三/myTable.csv'
#随机生成Math分数
set.seed(1)
Math <- round(runif(100, 0, 500), 2)
Math
#随机生成English分数
set.seed(2)
English <- round(runif(100, 0, 50), 2)
English
#随机生成Java分数
set.seed(3)
Java <- round(runif(100, 0, 100), 2)
Java
#随机生成Sports分数
set.seed(4)
Sports <- round(runif(100, 0, 30), 2)
Sports

#名字生成
name <- paste("小赵", 1:100, sep = "")
#id生成
id <- rep(1:100)
#gender随机生成
set.seed(5)
gender <- sample(c("F", "M"), 100, replace = TRUE)

#生成数据框
grade <- data.frame(id, name, gender, Math, English, Java, Sports)

#去行名写入文件
write.csv(grade, fileName, row.names = FALSE)

#读取.csv文件
myTable <- read.csv(fileName, header = TRUE)

#抽取50行观测
set.seed(6)
attach(myTable)
newTable <- myTable[sample(1:100, 50, replace = FALSE), ]
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
newTable$Sports <- fun(newTable$Sports) 
#方法二
#返回的是列表
y <- lapply(newTable[, 4: 7], fun)
#转化成数据框
y <- as.data.frame(y)


#求平均
#按行求平均
#可以用cbind()合并
newTable <- transform(newTable, average = apply(newTable[, 4: 7], 1, mean))

#分位点
quantile <- quantile(newTable$average, c(0.75, 0.5, 0.25))

#新增变量
newTable <- within(newTable, {
  grade <- NA
  grade[average >= quantile["75%"]] <- "优秀"
  grade[average < quantile["75%"] & average >= quantile["50%"] ] <- "中等"
  grade[average < quantile["50%"]] <- "较差"
})

#根据id排序
newTable[order(newTable$id), ]

#根据name排名
#截取姓
z <- substr(newTable$name, 1, 1) == "小"

orderByName <- newTable[order(newTable$name), ]
#选出同姓
orderByName[z, ]

#myvars <- grepl("小赵", newTable$name)
#na.omit(orderByName[newTable$name, ])




