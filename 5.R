#举个栗子

attach(mtcars)
plot(wt, mpg)
abline(lm(mpg~wt))#lm函数能够做线性拟合，lm(a~b)就是对a=k*b+c进行线性拟合
title("回归曲线")
detach(mtcars)

 #lm(mtcars$mpg~mtcars$wt)

dev.new()
plot(mtcars$wt, mtcars$mpg)
 #dev.off(5)
dev.new()
plot(mtcars$wt, mtcars$mpg)
dev.off(5)#关闭指定设备号的绘图设备

#一个简单的例子
dose  <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)
plot(dose,drugA,type = "b")



plot(dose, drugA, type="b")

#图形和参数
opar <- par(no.readonly=TRUE)
par(lty=2, pch=17)
plot(dose, drugA, type="b")
par(opar)



#plot(dose, drugA, type="b", lty=2, pch=17)

plot(dose, drugA, type="b", lty=3, lwd=3, pch=15, cex=2)

#
n <- 7
mycolors <- rainbow(n)
pie(c(1,1,1,1,1,1,1), labels=mycolors, col=mycolors) 


#衬线无衬线http://www.mrszhao.com/post/72.html

#使用图形参数控制图形外观
dose  <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)


opar <- par(no.readonly=TRUE)
par(pin=c(2, 3))
par(lwd=2, cex=1.5)
par(cex.axis=0.75,font.axis=3)
plot(dose, drugA, type="b", pch=19, lty=2, col="red")
plot(dose, drugB, type="b", pch=23, lty=6, col="blue", bg="green")
par(opar)


#坐标轴  lty线条类型 pch 符号  lwb 线条宽度 b同时绘制点和线
plot(dose, drugA, type="o",
     col="red", lty=2, pch=2, lwd=2,
     main="Clinical Trials for Drug A",
     sub="This is hypothetical data",
     xlab="Dosage", ylab="Drug Response",
     xlim=c(0, 60), ylim=c(0, 70))

#坐标轴示例
x <- c(1:10)
y <- x
x
y
z <- 10/x
z

x <- c(1:10)
y1 <- 2 ^ x
y2 <- x ^ 2


opar <- par(no.readonly=TRUE)
par(mar=c(5, 4, 4, 8) + 0.1)


plot(x, y1, type="b",
     pch=21, col="red",
     yaxt="n", lty=3, ann=FALSE)

lines(x, y2, type="b", pch=22, col="blue", lty=2)

axis(2, at=x, labels=x, col.axis="red", las=2)
axis(4, at=z, labels=round(z, digits=2),
     col.axis="blue", las=2, cex.axis=0.7, tck=-.01)


mtext("y=1/x", side=4, line=3, cex.lab=1, las=2, col="blue")
title("An Example of Creative Axes",
      xlab="X values",
      ylab="Y=X")

par(opar)

#图例：

install.packages("Hmisc")

dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)
opar <- par(no.readonly=TRUE)
#font.axis。坐标轴刻度值的字型。font.lab。坐标轴名称的字型。font.main。主标题的字型。font.sub。子标题的字型
#pch：表示点的形状, ylim: 设置y轴范围
par(lwd=2, cex=1.5, font.lab=2)
plot(dose, drugA, type="b",
     pch=15, lty=1, col="red", ylim=c(0, 60),
     main="Drug A vs. Drug B",
     xlab="Drug Dosage", ylab="Drug Response")
#加参考线
lines(dose, drugB, type="b",
      pch=17, lty=2, col="blue")
#加水平线
abline(h=c(30), lwd=1.5, lty=2, col="gray")
library(Hmisc)
#次刻度线
minor.tick(nx=3, ny=3, tick.ratio=0.5)
#图例
#inset：外边距
#"topleft"可以换成locator(1)，图例在鼠标点击的地方生成
legend("topleft", inset=.05, title="Drug Type", c("A","B"),
       lty=c(1, 2), pch=c(15, 17), col=c("red", "blue"))
par(opar)

#文本标注
attach(mtcars)
plot(wt, mpg,
     main="Mileage vs. Car Weight",
     xlab="Weight", ylab="Mileage",
     pch=18, col="blue")
text(wt, mpg,
     row.names(mtcars),
     cex=0.6, pos=4, col="red")

detach(mtcars)

#图形的组合
attach(mtcars)
opar <- par(no.readonly=TRUE)
#指定两行两列， 按行填充进行绘图，总共可以画四幅图
par(mfrow=c(2,2))
plot(wt,mpg, main="Scatterplot of wt vs. mpg")
plot(wt,disp, main="Scatterplot of wt vs disp")
hist(wt, main="Histogram of wt")
boxplot(wt, main="Boxplot of wt")
par(opar)
detach(mtcars)
#

attach(mtcars)
opar <- par(no.readonly=TRUE)
par(mfrow=c(3,1))
hist(wt)
hist(mpg)
hist(disp)
par(opar)
detach(mtcars)

#
attach(mtcars)
#传入矩阵，指定多图所在位置， 2，2表示分4份， byrow=TRUE表示按行填充
layout(matrix(c(1, 1, 2, 3), 2, 2, byrow = TRUE)) #1，1，2，3代表第一幅图，占1和2两个区域，第二幅图占第三个区域，第四幅图占第四个区域
hist(wt)
hist(mpg)
hist(disp)
detach(mtcars)
