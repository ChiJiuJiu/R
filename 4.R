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

#六、将函数应用于数据框

a <- matrix(runif(12),nrow=3)
a

mean(a)
apply(a, 1, mean)
apply(a, 2, mean)


#七、循环语句

for (i in 1:10) print("Hello")

i <- 10
while (i > 0) {print("Hello"); i <- i - 1}


#八、条件执行语句
x <- 2.0

if (x< 0.2){
  x <- x+1
  print("success!")
}else{
  x <- x-1
  print("else success!")
}


x <- c(1,1,1,0,0,1,1)
ifelse(x != 1, 1, 0) 

result <- 3
switch(result,"低异常点","偏低","正常","偏高","高异常点")

#自定义函数
mystats <- function(x, parametric=TRUE, print=FALSE) {
  if (parametric) {
    center <- mean(x); spread <- sd(x)
  } else {
    center <- median(x); spread <- mad(x)
  }
  if (print & parametric) {
    cat("Mean=", center, "\n", "SD=", spread, "\n")
  } else if (print & !parametric) {
    cat("Median=", center, "\n", "MAD=", spread, "\n")
  }
  result <- list(center=center, spread=spread)
  return(result)
}
#要生成一些数据（服从正态分布的，大小为500的随机样本）
set.seed(1234)
x <- rnorm(500)
y <- mystats(x)
y <- mystats(x, parametric=FALSE, print=TRUE)


#九、自定义函数
mydate <- function(type="long") {
  switch(type,
         long =  format(Sys.time(), "%A %B %d %Y"),
         short = format(Sys.time(), "%m-%d-%y"),
         cat(type, "is not a recognized type\n")
  )
}

mydate("long")
mydate("short")
mydate()
mydate("medium")

#十、整合和重塑
 #转置
str(mtcars)
head(mtcars,n=2)
cars <- mtcars[1:5, 1:4] 
t(cars)

 #整合数据
 #Group.1表示汽缸数量（4、6或8），Group.2代表挡位数（3、4或5）。
attach(mtcars)
aggdata <-aggregate(mtcars, by=list(cyl,gear), 
                    FUN=mean, na.rm=TRUE)
aggdata
detach(mtcars)


 #reshape包
ID <- c(1,1,2,2)
Time <- c(1,2,1,2)
X1 <- c(5,3,6,2)
X2 <- c(6,5,1,4)
mydata <- data.frame(ID,Time,X1,X2,stringsAsFactors=FALSE)

 #install.packages("reshape")
library(reshape)
md <- melt(mydata, id=(c("ID", "Time")))

cast(md,ID+Time~variable)
cast(md,ID+variable~Time)
cast(md,ID~variable+Time)

cast(md,ID~variable,mean)
cast(md,Time~variable,mean)
cast(md,ID~Time,mean)


