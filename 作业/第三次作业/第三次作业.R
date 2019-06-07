par(opar)
#导包
install.packages("vcd")
library(vcd)
str(Arthritis)
head(Arthritis)
counts <- table(Arthritis$Improved)

#条形图
barplot(counts, main = "Simple Bar Plot",
        xlab = "Improvement", ylab = "Frequency"
        )

#水平条形图
barplot(counts, 
        main = "bar plot",
        xlab = "Improvement", ylab = "Frequency",
        horiz = TRUE
        )

#利用plot
plot(counts, main = "Simple Bar Plot",
     xlab = "Improvement", ylab = "Frequency")
plot(counts, 
        main = "bar plot",
        xlab = "Improvement", ylab = "Frequency",
        horiz = TRUE
)


#均值条形图
states <- data.frame(state.region, state.x77)
head(states)
means <- aggregate(states$Illiteracy, by = list(state.region), FUN = mean)
means <- means[order(means$x),]
barplot(means$x, names.arg=means$Group.1) 
title("Mean Illiteracy Rate")  

#1.绘制简单条形图、堆砌条形图、分组条形图，并在同一幅画面中展示。
opar <- par(no.readonly=TRUE)
counts <- table(Arthritis$Improved)
layout(matrix(c(1, 2, 3), 1, 3, byrow = TRUE))
# 简单条形图
barplot(counts, 
        main="简单条形图",
        xlab="Improvement", ylab="Frequency")
counts <- table(Arthritis$Improved, Arthritis$Treatment)
#堆砌条形图
barplot(counts, 
        main="堆砌条形图",
        xlab="Treatment", ylab="Frequency", 
        col=c("red", "yellow","green"),            
        legend=rownames(counts))
#分组条形图
barplot(counts, 
        main="分组条形图", 
        xlab="Treatment", ylab="Frequency",
        col=c("red", "yellow", "green"),
        legend=rownames(counts), beside=TRUE)


#2.绘制一幅直方图， 需要设置颜色、组数、标签以及标题，并叠加轴须图和密度曲线，最后用盒围起来。
layout(matrix(c(1, 1, 2, 2), 2, 2, byrow = TRUE))
x <- mtcars$mpg
#轴须图
hist(x, 
     freq=FALSE, #freq=FALSE表示根据概率密度
     breaks=12, 
     col="red", 
     xlab="每加仑英里数", 
     main="直方图和轴须图")  
rug(jitter(mtcars$mpg))#rug在坐标轴上标出元素出现的频数
lines(density(mtcars$mpg), col="blue", lwd=2)
box()
#加密度曲线
h<-hist(x, 
        breaks=12, 
        col="yellow", 
        xlab="每加仑英里数", 
        main="直方图和密度曲线") 
xfit<-seq(min(x),max(x),length=40) 
yfit<-dnorm(xfit,mean=mean(x),sd=sd(x)) 
yfit <- yfit*diff(h$mids[1:2])*length(x) # 频数=频率/组距*组距*总数~密度*组距*总数
lines(xfit, yfit, col="blue", lwd=2)
box()
par(opar)

#3. 并列箱线图
boxplot(mpg ~ cyl, data=mtcars,
        main="Car Mileage Data",
        xlab="Number of Cylinders",
        ylab="Miles Per Gallon")

# 4.对mtcars数据集mpg属性绘制分组点图(按照cyl进行分组)
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





