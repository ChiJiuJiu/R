#成绩表
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

#读取.csv文件\
fileName <- 'D:/数据分析与R语言/R/实验/实验三/myTable.csv'
myTable <- read.csv(fileName, header = TRUE)
myTable

#名字生成
name <- paste("小赵", 1:100, sep = "")
#id生成
id <- rep(1:100)
#gender随机生成
set.seed(5)
gender <- sample(c("F", "M"), 100, replace = TRUE)

#生成数据框
grade <- data.frame(id, gender, Math, English, Java, Sports)

#去行名写入文件
write.csv(grade, fileName, row.names = FALSE)
