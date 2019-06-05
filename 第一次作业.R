#字符型向量
a <- c("赵宜珺1", "赵宜珺2", "赵宜珺3")
#逻辑型向量
b <-c(TRUE, TRUE, FALSE)
#数值型向量
c <- c(1, 2, 3)
#4.创建一个5*4的矩阵，按行排列，并为其行和列命名
y <- matrix(1:20, nrow = 5, ncol = 4, byrow = TRUE, dimnames = list(c("R1", "R2", "R3", "R4", "R5"), c("C1", "C2", "C3", "C4"))) 
#访问第二行
y[2, ]
#访问第三列
y[, 3]
#访问第二行第三列的元素
y[2, 3]

# 创建一个数据框，要求有5个观测值4个变量，并访问数据框中的元素
pId <- c(1, 2, 3, 4)
AmdData <- c("10/15/2019", "11/01/2009", "10/21/2009", "10/28/2009")
age <- c(25, 34, 28, 52)
db <- c("Type1", "Type2", "Type1", "Type1")
status <- c("Poor", "Improved", "Excellent", "Poor")
pd <- data.frame(pId, AmdData, age, db, status, stringsAsFactors = FALSE)

#访问第一行到第二行所有列
pd[1:2, ]

#访问第一行第三列
pd[1, 3]

#5.创建一个2*4*5的数组，并为各维度命名
z <- array(1 : 40, c(2, 4, 5))
d1 <- c("A1", "A2")
d2 <- c("B1", "B2", "B3", "B4")
d3 <- c("C1", "C2", "C3", "C4", "C5")
z <- array(1 : 40, c(2, 4, 5), dimnames = list(d1, d2, d3))

#访问第一行第一列
z[1, 1, ]
#C2的第一行第一列
z[1, 1, 2]

#自定义一个列表并访问列表的元素
listName <- "自定义的列表"
numbers <- c(1, 2, 3, 4, 5, 6) #向量
myMatrix <- matrix(1 : 10, nrow = 5, byrow = TRUE) #矩阵
myArrary <- array(1 : 20, c(2, 5, 2)) #数组
id <- c(1, 2)
name <- c("赵宜珺1", "赵宜珺2")
myFrame <- data.frame(id, name) #数据框
#创建列表
myNewList <- list(title = listName, numbers = numbers, matrix = myMatrix, arrary = myArrary, frame = myFrame)

#访问numbers
myNewList["numbers"]
#访问matrix的第二行第一列
myNewList$matrix[2][1]