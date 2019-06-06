#综合案例解决方案

Student <- c("John Davis", "Angela Williams", "Bullwinkle Moose",
             "David Jones", "Janice Markhammer", "Cheryl Cushing",
             "Reuven Ytzrhak", "Greg Knox", "Joel England",
             "Mary Rayburn")
Math <- c(502, 600, 412, 358, 495, 512, 410, 625, 573, 522)
Science <- c(95, 99, 80, 82, 75, 85, 80, 95, 89, 86)
English <- c(25, 22, 18, 15, 20, 28, 15, 30, 27, 18)

roster <- data.frame(Student, Math, Science, English,
                     stringsAsFactors=FALSE)

#2由于数学、科学和英语考试的分值不同（均值和标准差相去甚远），在组合之前需
#要先让它们变得可以比较。一种方法是将变量进行标准化，这样每科考试的成绩就
#都是用单位标准差来表示，而不是以原始的尺度来表示了。
#这个过程可以使用scale()函数来实现：

z <- scale(roster[,2:4])

#3通过函数mean()来计算各行的均值以获得综合得分，
#并使用函数 cbind()将其添加到花名册中
score <- apply(z, 1, mean)
roster <- cbind(roster, score)

#4函数quantile()给出了学生综合得分的百分位数
#quantile()函数的算法是采用加权平均，成绩为A的分界点 为0.74，B的分界点为0.44，等等
y <- quantile(score, c(.8,.6,.4,.2))

#5通过使用逻辑运算符，可以将学生的百分位数排名重编码为一个新的类别型成绩变量。
roster$grade[score >= y[1]] <- "A"
roster$grade[score < y[1] & score >= y[2]] <- "B"
roster$grade[score < y[2] & score >= y[3]] <- "C"
roster$grade[score < y[3] & score >= y[4]] <- "D"
roster$grade[score < y[4]] <- "F"

#6你将使用函数strsplit()以空格为界把学生姓名拆分为姓氏和名字。
name <- strsplit((roster$Student), " ")

#7 你可以使用函数sapply()提取列表中每个成分的第一个元素，放入一个储存名字 的向量，
#并提取每个成分的第二个元素，放入一个储存姓氏的向量
Lastname <- sapply(name, "[", 2)
Firstname <- sapply(name, "[", 1)
roster <- cbind(Firstname,Lastname, roster[,-1])#roster[,-1]删除原第一列

#8使用函数order()依姓氏和名字对数据集进行排序
roster <- roster[order(Lastname,Firstname),]

