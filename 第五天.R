#基本图形
#举个栗子
attach(mtcars)
#点图，wt：车重， mpg：每加仑行驶公里数
plot(wt, mpg)
lm(mpg~wt) #找到线性回归的参数
#拟合曲线
abline(lm(mpg~wt))
title("wt和mpg的关系图")
detach(mtcars)

#新建弹窗
dev.new()
plot(mtcars$wt, mtcars$mpg)

dev.new()
plot(mtcars$wt, mtcars$mpg)
lm(mtcars$wt~mtcars$mpg)
abline(lm(mtcars$wt~mtcars$mpg))
dev.off(5)

#示例
dose <- c(20, 30, 40, 45, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)
plot(dose, drugA, type = "o")
plot(dose, drugA, type = "b")


#图形修改
opar <- par(no.readonly = TRUE)
par(lty = 2, pch = 17, cex = 2)
plot(dose, drugA, type = "o")


#取颜色
#取七种连续的颜色
n <- 7
mycolors <- rainbow(n)
#画饼图
pie(rep(1: n), col = mycolors, labels = mycolors)



#控制图形的外观
dose <- c(20, 30, 40, 50, 60)
drugA <- c(16, 20, 27, 40, 60)
drugB <- c(15, 18, 25, 31, 40)
#保存当前环境
opar <- par(no.readonly=TRUE)
#设置当前的维度，形式为c(width,height)，单位为英寸。
par(pin=c(2, 2))
#lwd：线条宽度。必须为一个整数，默认值为1。具体的实现根据设备而定，有一些绘图设备不支持线条宽度小于1。
#cex：用于表示对默认的绘图文本和符号放大多少倍。需要注意一些绘图函数如plot.default等也有一个相同名字的参数，但是此时表示在函数par()的参数cex的基础上再放大多少倍，此外还有函数points等接受一个数值向量为参数。
par(lwd=2, cex=1.5)
#cex.axis：表示在当前的cex设定情况下，对坐标轴刻度值字体的放大倍数。
par(cex.axis=0.75,font.axis=3)
#pch：表示点的形状，它的值可以为数值型（介于0到25之间的数值），也可以为字符型。1代表圆圈，2代表三角形，3代表“+”号。当pch的值为字符型时，那么点就通过该字符来表示。
#lty：直线类型。参数的值可以为整数（0为空，1为实线（默认值），2为虚线，3为点线，还可以为4、5、6等），也可以为字符串（和整数是一一对应的，如"blank"、"solid"、"dashed"、"dotted"、"dotdash"、"longdash"或者"twodash"
#col：用于设定默认的绘图颜色。
plot(dose, drugA, type="o", pch=10, lty=6, col="red", bg="blue")
#bg：用于设定绘图区域的背景颜色。当通过函数par()调用时，会同时设定参数new=FALSE。对很多设备来说，该参数的初始值就是该设备的背景颜色值，其他情况下一般为"white"。需要注意一点的是，一些图形函数例如plot.default和points等也有名为bg的参数，但是代表的含义是不同的。
plot(dose, drugB, type="b", pch=23, lty=6, col="blue", bg="green")
#还原环境
par(opar)



#坐标轴示例
x <- c(1:10)
y <- x
x
y
z <- 10/x
z

opar <- par(no.readonly=TRUE)
#mar指整个图的边界距离; mgp指坐标轴与图之前的距离
par(mar=c(5, 4, 4, 8) + 0.1)


plot(x, y, type="b",
     pch=21, col="red",
     yaxt="n", lty=3, ann=FALSE)

lines(x, z, type="b", pch=22, col="blue", lty=2)

axis(2, at=x, labels=x, col.axis="red", las=2)
axis(4, at=z, labels=round(z, digits=2),
     col.axis="blue", las=2, cex.axis=0.7, tck=-.01)


mtext("y=1/x", side=4, line=3, cex.lab=1, las=2, col="blue")
title("An Example of Creative Axes",
      xlab="X values",
      ylab="Y=X")

par(opar)





















