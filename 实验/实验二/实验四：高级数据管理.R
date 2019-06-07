#准备数据
 #生成随机数

z <- sample(1:500,100)
 
English <- round(runif(100,min=0,max = 50))
Java <- round(runif(100,min=0,max = 100))
Sports <- round(runif(100,min=0,max = 30))

data <- data.frame(Math,English,Java,Sports)


#写入到文件中

write.csv(data,file="data.csv",row.names=TRUE)
getwd()

#####################################################
#导入数据
student <-read.table("D:\\实施\\2019盐城师范\\山东女子\\R语言\\统计分析与R语言\\实验\\data1.csv",header = TRUE,sep=",")
str(student)
head(student)


#随机抽取50行数据
x <- sample(1:100,50,replace = FALSE)
student_sam <- student[x,]

#自定义标准化函数
normalize <- function(x) {
  
  return ((x - min(x)) / (max(x) - min(x)))
}


 #lapply()函数将normalize()函数应用到数据框中的每一个特征
 #应用函数as.data.frame()把lapply()返回的列表转换成一个数据框
y <- lapply(student_sam[,4:7], normalize)
student_nor <- as.data.frame(y)

score <- apply(student_nor, 1, mean)
student_sam <- cbind(student_sam,score)

 #求分位点
  #quantile(student_sam$score,c(.75,.5,.25)）
y <- quantile(student_sam$score)

 #创建变量grade，并根据条件进行赋值
student_sam$grade[student_sam$score >= y[4]] <- "优秀"
student_sam$grade[student_sam$score < y[4] & student_sam$score  > y[3]] <- "中等"
student_sam$grade[student_sam$score <= y[3]] <- "较差"


#根据id排序

student_sam <- student_sam[order(student_sam$id),]

#根据name排序

student_sam_name <- student_sam[order(student_sam$name),] 
z <- substr(student_sam$name,1,1)=="张"
z
student_sam_sel <- student_sam[z,]



