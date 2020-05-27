
city <- c("Seoul","Tokyo","Washington")
rank <- c(1,3,2)
city.info <- data.frame(city, rank)
city.info


#iris 데이터 셋
iris
#Sepal.Length,Sepal.Width : 꽃받침 길이 , 폭
#Petal.Length,Petal.Width : 꽃잎 길이 , 폭
#Species : 종 種

#1,2 열의 모든 데이터
iris[,1:2]
#1,3,5 열의 모든 데이터
iris[,c(1,3,5)]
#1,5 열의 모든 데이터 1- Sepal.Length, 5 - Species
iris[,c('Sepal.Length','Species')]
#1~5행의 모든 데이터
iris[1:5,]
#1~5행의 데이터 중 1, 3열의 데이터
iris[1:5,c(1,3)]


is.data.frame(iris) #객체가 data.frame 인지 확인
iris[,"Species"] #결과가 vector == iris[,5]
iris["Species"] #결과가 n x1 data frame
iris$Species #결과가 vector

## 데이터셋의 기본 정보 확인
 dim(iris)# 행과 열의 개수 출력
 nrow(iris) #행의 수 보이기
 ncol(iris) #열의 수 보이기
 names(iris) #컬럼이름 보이기기
 head(iris) #데이터셋의 앞부분 일부 보기기 
 tail(iris) #데이터셋의 뒷부분 일부 보기기 
 str(iris) #데이터셋 요약 보기기 
 unique(iris[,5]) # 종의 종류 보기(중복 제거) 
 table(iris[,"Species"]) #종의 종류별 instance count 
 colSums(iris[,-5]) #열별합계
 colMeans(iris[,-5]) #열별 평균
 rowSums(iris[,-5]) #행별 합계
 rowMeans(iris[,-5]) #행별 평균
 
 # 행과 열의 방향 전환

z <-  matrix(1:20, nrow=4,ncol=5)
z 
t(z) #행열 바꾸기

 # 조건에 맞는 행과 열의 값 추출
IR.1 <- subset(iris, Species=='Setosa')
IR.1
IR.2 <- subset(iris, Sepal.Length>5.0& Sepal.Width>4.0)
IR.2
IR.2[,c(2,4)]


# matrix, dataframe 에 대한 산술연산

a <-  matrix(1:20,4,5)
a 
b <- matrix(21:40,4,5) 
b
a+b
b-a
b/a
a*b
3*a
b-5
2*a + 3*b
a <- a*3
a
b <- b-5
b

#matrix, dataframe 자료구조 확인

iris 
state.x77

class(iris)
class(state.x77)
is.data.frame(state.x77)
is.matrix(state.x77)

# matrix --> dataframe 변환
st <- data.frame(state.x77)
st
is.data.frame(st)

# dataframe --> matrix 변환
iris.m <- as.matrix(iris[,1:4])
head(iris.m)
class(iris.m)
names(st)
colnames(st)
rownames(st)

#dataframe 열 추출

iris[,"Species"] #결과=벡터. matrix, dataframe 다 가능
iris[,5] # 결과=벡터. matrix, dataframe 다 가능
iris["Species"] #결과=dataframe. dataframe 만 가능
iris[5] #결과=dataframe. dataframe 만 가능
iris$Species #결과=벡터. dataframe 다 가능


library(readr)
airquality <- read_csv("C:/Users/user/Desktop/BigDataCourse/R/airquality.csv")
View(airquality)

setwd("C:/Users/user/Desktop/BigDataCourse/R")
air <- read.csv("airquality.csv", header=T)
head(air)

#파일 데이터 쓰기
 # Setosa 품종 데이터만 추출
my.iris <- subset(iris, Species=="setosa")
my.iris
iris
write.csv(my.iris, 'my_iris.csv', row.names=F)
