#一、条形图
install.packages("vcd")
library(vcd)
counts <- table(Arthritis$Improved)#table 函数对应的就是统计学中的列联表，是一种记录频数的方法.

head(Arthritis)#查看数据集
data(Arthritis)
str(Arthritis)

 # 简单条形图
barplot(counts, 
        main="Simple Bar Plot",
        xlab="Improvement", ylab="Frequency")
 # 水平条形图   
barplot(counts, 
        main="Horizontal Bar Plot", 
        xlab="Frequency", ylab="Improvement", 
        horiz=TRUE)
 #等同于如下的代码
plot(Arthritis$Improved, main="Simple Bar Plot",
     xlab="Improved", ylab="Frequency")
plot(Arthritis$Improved, horiz=TRUE, main="Horizontal Bar Plot",
     xlab="Frequency", ylab="Improved")

 #堆砌条形图和分组条形图
library(vcd)
counts <- table(Arthritis$Improved, Arthritis$Treatment)


barplot(counts, 
        main="Stacked Bar Plot",
        xlab="Treatment", ylab="Frequency", 
        col=c("red", "yellow","green"),            
        legend=rownames(counts)) 

                      
barplot(counts, 
        main="Grouped Bar Plot", 
        xlab="Treatment", ylab="Frequency",
        col=c("red", "yellow", "green"),
        legend=rownames(counts), beside=TRUE)

 #均值条形图
states <- data.frame(state.region, state.x77)
head(state.x77)
head(states)

means <- aggregate(states$Illiteracy, by=list(state.region), FUN=mean)
means

means <- means[order(means$x),]  
means

barplot(means$x, names.arg=means$Group.1) 
title("Mean Illiteracy Rate")  

 #微调的垂直直方图
par(mar=c(5,8,4,2))
par(las=2)
counts <- table(Arthritis$Improved)

barplot(counts,
        main="Treatment Outcome",
        horiz=TRUE, cex.names=0.7,
        names.arg=c("No Improvement", "Some Improvement",
                    "Marked Improvement"), )
 #棘状图
library(vcd)
attach(Arthritis)
counts <- table(Treatment, Improved)
spine(counts, main="Spinogram Example")
detach(Arthritis)

#二、饼图

par(mfrow=c(2,2)) #一个图版显示2行,2列                            
slices <- c(10, 12,4, 16, 8) 
lbls <- c("US", "UK", "Australia", "Germany", "France")

pie(slices, labels = lbls, 
    main="Simple Pie Chart")

pct <- round(slices/sum(slices)*100)                      
lbls <- paste(lbls, pct) #字符串连接函数paste
lbls <- paste(lbls,"%",sep="")
pie(slices,labels = lbls, col=rainbow(length(lbls)),
    main="Pie Chart with Percentages")

install.packages("plotrix")
library(plotrix)                                               
pie3D(slices, labels=lbls,explode=0.1,
      main="3D Pie Chart ") #表示两块扇形图是结合在一起

mytable <- table(state.region)#统计频次                                 
lbls <- paste(names(mytable), "\n", mytable, sep="")
pie(mytable, labels = lbls, 
    main="Pie Chart from a dataframe\n (with sample sizes)")

par(opar)

 #扇形图
library(plotrix)
slices <- c(10, 12,4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
fan.plot(slices, labels = lbls, main="Fan Plot")

#三、直方图
# 简单直方图                                                        1
hist(mtcars$mpg)

#指定分组的直方图        
hist(mtcars$mpg, 
     breaks=12, 
     col="red", 
     xlab="Miles Per Gallon", 
     main="Colored histogram with 12 bins")

# 加轴须图的直方图 
hist(mtcars$mpg, 
     freq=FALSE, #freq=FALSE表示根据概率密度
     breaks=12, 
     col="red", 
     xlab="Miles Per Gallon", 
     main="Histogram, rug plot, density curve")  
rug(jitter(mtcars$mpg))#rug在坐标轴上标出元素出现的频数
lines(density(mtcars$mpg), col="blue", lwd=2)

# 【了解】加正态曲线的直方图  
x <- mtcars$mpg 
h<-hist(x, 
        breaks=12, 
        col="red", 
        xlab="Miles Per Gallon", 
        main="Histogram with normal curve and box") 
xfit<-seq(min(x),max(x),length=40) 
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x)) 
yfit <- yfit*diff(h$mids[1:2])*length(x) # 频数=频率/组距*组距*总数~密度*组距*总数
lines(xfit, yfit, col="blue", lwd=2)
box()

#四、核密度图
par(mfrow=c(2,1))
d <- density(mtcars$mpg)

plot(d)

d <- density(mtcars$mpg)
plot(d, main="Kernel Density of Miles Per Gallon")
polygon(d, col="red", border="blue")
rug(mtcars$mpg, col="brown")

#[了解]可比较的核密度图
install.packages("sm")
par(lwd=2) 
library(sm)
attach(mtcars)

cyl.f <- factor(cyl, levels= c(4, 6, 8),                               
                labels = c("4 cylinder", "6 cylinder", "8 cylinder")) 

sm.density.compare(mpg, cyl, xlab="Miles Per Gallon")                
title(main="MPG Distribution by Car Cylinders")


colfill<-c(2:(2+length(levels(cyl.f)))) 
cat("Use mouse to place legend...","\n\n")
legend(locator(1), levels(cyl.f), fill=colfill) 
detach(mtcars)

#五、箱线图

boxplot(mtcars$mpg, main="Box plot", ylab="Miles per Gallon")
boxplot.stats(mtcars$mpg)

#并列箱线图
boxplot(mpg ~ cyl, data=mtcars,
        main="Car Mileage Data",
        xlab="Number of Cylinders",
        ylab="Miles Per Gallon")

#含凹槽的箱线图
boxplot(mpg ~ cyl, data=mtcars,
        notch=TRUE,
        varwidth=TRUE,
        col="red",
        main="Car Mileage Data",
        xlab="Number of Cylinders",
        ylab="Miles Per Gallon")

#两个交叉因子的箱线图
mtcars$cyl.f <- factor(mtcars$cyl,
                       levels=c(4,6,8),
                       labels=c("4","6","8"))


mtcars$am.f <- factor(mtcars$am, 
                      levels=c(0,1), 
                      labels=c("auto","standard"))


boxplot(mpg ~ am.f *cyl.f, 
        data=mtcars, 
        varwidth=TRUE,
        col=c("gold", "darkgreen"),
        main="MPG Distribution by Auto Type", 
        xlab="Auto Type")

#六、点图

dotchart(mtcars$mpg, labels=row.names(mtcars), cex=.7,
         main="Gas Mileage for Car Models",
         xlab="Miles Per Gallon")

#分组、排序、着色后的点图
x <- mtcars[order(mtcars$mpg),]
x$cyl <- factor(x$cyl)
x$color[x$cyl==4] <- "red"
x$color[x$cyl==6] <- "blue"
x$color[x$cyl==8] <- "darkgreen"
dotchart(x$mpg,
         labels = row.names(x),
         cex=.7,
         groups = x$cyl,
         gcolor = "black",
         color = x$color,
         pch=19,
         main = "Gas Mileage for Car Models\ngrouped by cylinder",
         xlab = "Miles Per Gallon")

