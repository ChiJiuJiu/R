x <- 1:8
x

#求平均值
mean(x)
#标准差
sd(x)
#长度
n <- length(x)
n
#求平均值的方法二
meanx <- sum(x) / n
meanx

#标准差公式求标准差
css <- sum((x-mean(x))**2)
sdx <- sqrt(css/n)  #用sd(x)算时，内部是除n-1所以会不一样
sqrt(css/(n-1))#和sd(x)计算的结果一致

#中位数
median(x)
#方差
var(x)
#绝对中位差
mad(x)
#分位数
quantile(x, c(.3, .84))
#值域
range(x)
#求和
sum(x)
#滞后差分
diff(x)
#最小值
min(x)
#最大值
max(x)
#按列进行中心化标准化
scale(x, center = TRUE, scale = TRUE)
#绝对值
abs(-1)
#平方根
sqrt(25)
25 ^ (0.5)
#不小于x的最小整数
ceiling(2.9)
#不大于x的最大整数
floor(3.2)
#向0方向截取x的整数部分
trunc(5.9)
#x舍入为指定位数的小数
round(3.141, 2)
#x舍入为指定有效数字的小数
signif(3.141, 2)
#三角函数，对数函数
cos(10)
sin(10)
tan(10)
log10(10)

#示例

#概率函数
#在两个数之间取一些点
x <- pretty(c(-3, 3), 30) #在-3，3之间，取30个数（数轴分成30份）
x
#正态分布
y <- dnorm(x)
y

#画图
#默认是点线图
plot(x, y)
#指定为线图
plot(x, y, type = "l", xlab = "x值", ylab = "y值")

#位于z=1.96左侧的标准正态曲线下方的面积
pnorm(1.96)

#均值为500，标准差为100的正态分布的0.9分位点值
qnorm(0.9, mean = 500, sd = 100)

#生成50个随机数，均值为50，标准差为10
rnorm(50, mean = 50, sd = 10)

#生成5个均匀分布的随机数
#随机数种子
set.seed(12) #可以随便设定
#符合均匀吩咐
runif(5) #设定了随机数种子，每次生成随机数都一样

#均值为0，标准差为1的随机数
#随机数种子
set.seed(1) #可以随便设定
#符合正态分布
rnorm(5) #设定了随机数种子，每次生成随机数都一样

#字符函数
x <- c("ab", "cde", "fghij")
length(x)
#子串长度
nchar(x[3])

x <- "abcdefg"
#子串
substr(x, 2, 5)
#搜索，fixed=false代表第一个参数是正则，反之则为字符串
grep("A", c("b", "A", "A", "d"), fixed = FALSE)
#分割字符串
strsplit("abcdef", "c")
#插入字符
paste("x", 1:4, sep = "M")#sep指定间隔符

#大小写转化
toupper("abc")
tolower("ABC")

#其他实用函数
#有间隔的取数
x <- seq(1, 10, 2)
x
#重复取数
x <- rep(1:5, 3)
x
#连接对象
firstname <- "jane"
cc <- c(1, 2, 3)
#sep表示分割符，""代表无分割，默认是是一个空格
cat("hello", firstname, cc, "\n", sep = "") 
name <- "Bob"
cat("hello", name, "\b.\n", "Isn\'t R", "\t", "GREAT?\n")

#将函数应用于数据框和矩阵
#符合均匀分布
a <- matrix(runif(12), nrow = 3)
a

#按行求平均
apply(a, 1, mean)
#按列求平均
apply(a, 2, mean)

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




