#一、数学函数
abs(-4)
sqrt(25)
ceiling(3.475)
floor(3.475)
trunc(5.99)
round(3.475, digits = 2)
signif(3.475, digits = 2)

cos(2)
log10(10)

#二、统计函数
mean(c(1,2,3,4))
median(c(1,2,3,4,5))
sd(c(1,2,3,4,5))
var(c(1,2,3,4,5))
range(c(1,2,3,4))
sum(c(1,2,3,4,5))
min(c(1,2,3,4,5))
max(c(1,2,3,4,5))

 #案例
x <- 1:8
x
mean(x)
sd(x)

n <- length(x)
n
meanx <- sum(x)/n
meanx
css <- sum((x-mean(x))**2)
sdx <- sqrt(css/(n-1))

x <- 1:10
y <- mean(x)
z <- mean(x,trim = 0.1,na.rm = TRUE)

#三、概率函数

x <- pretty(c(-3,3),30)
x
y <- dnorm(x)
y

plot(x,y,
     type = "l",
     xlab = "x值",
     ylab = "y值")
pnorm(1.96)
qnorm(0.9,mean = 500,sd = 100)
rnorm(50,mean = 50,sd = 10)

set.seed(12)
runif(5)

set.seed(1)
rnorm(5)

#四、字符函数

x <- c("ab","cde","fghij")
length(x)
nchar(x[3])

x <- "abcdefg"
substr(x,2,5)

grep("A",c("b","A","c","d"),fixed = FALSE)
strsplit("abcdf","c")

paste("x",1:3,sep = "M")

toupper("abc")
tolower("ABC")


#五、其他实用函数
x <- seq(1,10,2)
x

x <- rep(1:5,2)
x

firstname <- "jane"
cat("hello",firstname,"\n")

name <- "Bob"
cat( "Hello", name, "\b.\n", "Isn\'t R", "\t", "GREAT?\n")







