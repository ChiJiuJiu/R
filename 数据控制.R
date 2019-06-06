#循环语句
for(i in 1:10) print("hello")

#while语句
i <- 10
while (i > 0) {
  print("hello"); i <- i - 1
}

#条件执行
x <- c(1, 1, 1, 0, 0, 1, 1)
ifelse(x != 1, 1, 0)
a <- 10
if(a == 10){
  print("ok")
}else{
  print("no")
}


#switch结构
result <- 3
switch(result, "123", "321", "111")

#函数

myFun <- function(x, param = FALSE, parametric=TRUE, print = TRUE){
  if(param){
    print(x)
  }else{
    print("false")
  }
}
myFun(1)




