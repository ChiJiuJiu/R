#练习

#x最大值最小值标准化方法：x-min/(max-min)
#1.建立数据框
Student <- c("John Davis", "Angela Williams", "Bullwinkle Moose",
             "David Jones", "Janice Markhammer", "Cheryl Cushing",
             "Reuven Ytzrhak", "Greg Knox", "Joel England",
             "Mary Rayburn")
Math <- c(502, 600, 412, 358, 495, 512, 410, 625, 573, 522)
Science <- c(95, 99, 80, 82, 75, 85, 80, 95, 89, 86)
English <- c(25, 22, 18, 15, 20, 28, 15, 30, 27, 18)
roster <- data.frame(Student, Math, Science, English)


#2.标准化
formatMath <- (roster$Math - min(roster$Math)) / (max(roster$Math) - min(roster$Math))
roster$Math <- formatMath

formatScience <- (roster$Science - min(roster$Science)) / (max(roster$Science) - min(roster$Science))
roster$Science <- formatScience

formatEnglish <- (roster$English - min(roster$English)) / (max(roster$English) - min(roster$English))
roster$English <- formatEnglish

#3.求均值
roster <- transform(roster, average = apply(roster[, 2:4], 1, mean))

#4.分位点
quantile(roster$Math, c(0.8, 0.6, 0.4, 0.2))
quantile(roster$Science, c(0.8, 0.6, 0.4, 0.2))
quantile(roster$English, c(0.8, 0.6, 0.4, 0.2))

#5.创建变量
roster <- within(roster,{
  grade <- NA
  grade[average >= 0.8] <- "A"
  grade[average < 0.8 & average >= 0.6] <- "B"
  grade[average < 0.6 & average >= 0.4] <- "C"
  grade[average < 0.4 & average >= 0.2] <- "D"
  grade[average < 0.2] <- "E"
}
)

#6.分割姓名
roster$Student <- as.character(roster$Student)
is.character(roster$Student)
splitedNames <- strsplit(roster$Student, " ")

#7.提取姓名
FirstName<-sapply(splitedNames,"[", )
LastName<-sapply(splitedNames,"[", 2)

#8.添加到数据框
roster<-cbind(FirstName,LastName,roster[, -1])

#9.排序
roster[order(LastName,FirstName), ]

