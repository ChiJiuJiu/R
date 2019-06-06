#使用for结构和while结构自行设计一段R代码
bubbleSort = function(vector){
  n = length(vector)
  for(i in 1 : (n - 1)){
    for(j in (i + 1) : n){
      if(vector[i] >= vector[j]){
        temp = vector[i]
        vector[i] = vector[j]
        vector[j] = temp
      }
    }
  }
  return (vector)
}
num <- c(3, 2, 4, 10, 1)
bubbleSort(num)

#while
i <- 3
while(i > 0){
  print(i)
  i <- i - 1
}

#使用if-else、ifelse、switch自行设计一段R代码
myFun <- function(parameter){
  if(!is.numeric(parameter)){
    print("parameter invalid")
  }else{
    ifelse(parameter <= 0, "parameter <= 0", switch (parameter,print("parameter == 1")
    ))
  }
}
myFun(1)

#R函数
testFun <- function(){
  print("test")
}
testFun()
#数据整合重塑
id <- c(1, 2, 3, 4)
name <- c("小赵1", "小赵2", "小赵3", "小赵4")
math <- c(100, 90, 80, 99)
english <- c(80, 98, 97, 96)
chinese <- c(85, 98, 95, 100)
mydata <- data.frame(id, name, math, english, chinese)
install.packages("reshape")
library(reshape)
newdata <- melt(mydata)

#重塑
cast(newdata, name~variable)
