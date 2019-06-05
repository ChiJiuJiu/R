
#关于日期类型一些说明
#1、如果原始输入的字符串的年是四位：（1）使用%Y，输出为四位正确的值；（2）使用%y，输出为四位(取原四位中前2位作为新四位的后两位，新四位的前2位按照是否大于等于70，分别填充为19或者20)
dateTest <- c("10/24/2008","10/28/1980","10/1/2030","10/12/1980","5/1/2010")
dateTest1 <- as.Date(dateTest, "%m/%d/%Y")
dateTest2 <- as.Date(dateTest, "%m/%d/%y")
dateTest1
dateTest2

 #help(as.Date)

#2、如果原始输入的字符串的年是2位：（1）使用%Y，输出为四位前两位补0的值；（2）使用%y，输出为四位值(大于等于70填充前两位是19，小于70填充前2位为20)
dateTest3 <- c("10/24/08","10/28/80","10/1/30","10/12/70","5/1/10")
dateTest4 <- as.Date(dateTest3, "%m/%d/%Y")
dateTest5 <- as.Date(dateTest3, "%m/%d/%y")
dateTest4
dateTest5

#3、通过format函数指定具体格式类型
format(datetest1,format = "%m/%d/%y")

#建议：如果输入的类型是4位的年，用%Y，输入的类型是2位的年用%y，如果需要转换格式，先转换为日期类型，然后通过format函数实现。



