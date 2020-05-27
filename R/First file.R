5+8
3+(4*5)
a = 10
b <- 11
c <- 12
print(c)

library(ggplot2)

# R의 기본 연산
2^3 # 제곱 연산
8%%3 # 나눗셈의 나머지
#산술욘산 함수
log(10)+5 # 로그 함수

sqrt(25)#제곱근

max(5,3,2) # 가장 큰 값

abs(-10)# 절대값

factorial(5)

sin(pi/2) #삼각함수

#변수
a <- 10
b <- 20
c <- a +b
print(c)

#변수의 자료형
 #숫자 1,2,3, 문자 'a', 'b', "c", "hello"
 #논리형 : True, False
 #특수값 : NULL, NA 결측값, NaN 수학적으로 정의가 불가능
 #한 값, Inf, -inf: 양의 무한대, 음의 무한대


a <- 'A'
a + b


### 백터 ### c는 connect의 첫자를 따온것.

x <- c(1,2,3)  #숫자형 백터
y <- c("a","b","c") #문자형벡터
z <- c(TRUE, TRUE, FALSE, TRUE) # 논리형 벡터
x
y
z


w <- c(1,2,3,"a","b","c")
w

v1 <- 50:90
v1

v2 <- c(1,2,3, 50:90)
v2


#일정한 간격의 숫자로 이루어진 벡터 생성
v3 <- seq(1, 101, 3)
v3

v4 <- seq(0.1,1.0,0.1)
v4

#반복된 숫자로 이루어진 벡터 생성
# rep(반복대상값, 반복횟수)
v5 <- rep(1,times=8) # 1을 5번 반복하고 십다
v5
# 1에서 5까지 3변 반복
v6 <- rep(1:5,times=3)
v6

# 1, 5, 9 를 3번 반복 한다
v7 <- rep(c(1,5,9), 3)
v7


# 벡터의 원값에 이름지정
score <- c(90,85,70) # 성적
score

names(score) <- c("John", "Tom","Jane")
names(score)
score

# 벡터에서 원소값 추출
d <- c(1,4,3,7,8)
d
d[1]
d[2]
d[3]
d[5]


#1,3,5 번째 값 출력
d[c(1,3,5)]

#처음 세개의 값 출력
d[1:3]

#홀수 번쨰 값 출력
d[seq(1,5,2)]

#2번쨰 값제외하고 출력
d[-2]

#3~5번째 값은 제외하고 출력
d[-3:-5]
d[-c(3:5)]

# 벡터에서 이름으로 값을 추출하기
GNP <- c(2090, 2450, 960)
names(GNP) <-  c("Korea","Japan", "Nepal")
GNP[1]
GNP["Korea"]
GNP[c("Korea", "Nepal")]

#백터에 저장된 온소값 변경
v1 <- c(1,5,7,8,9)
v1

# v1의 2번째 값을 3으로 변경
v1[2] <- 3

#v1의 1, 5번쨰 값을 각각 10,20 으로 변경
v1[c(1,5)] <- c(10,20)


### 벡터의 연산

#벡터와 숫자값의 연산
d <- c(1,4,3,7,8)
2*d
d-5
3*d +4

#벡터와 벡터 간의 연산
x <- c(1,2,3)
y <- c(4,5,6)
x +y
z <- x +y
x*y

#벡터에 적용 가능한 함수들
d <- c(1,2,3,4,5,6,7,8,9,10)
sum(d) #자료의합
sum(2*d)
range(d)
length(d)
mean(d[1:5]) #자료의평균
max(d) #자료의
#최대 , 최소값
min(d)
sort(d) #자료를 정렬하여 출력
sort(d, decreasing=FALSE)
sort(d, decreasing=TRUE)
var(d) #자료의 분산 값
sd(d) # 표준편차
cumsum(d) #누적합계
diff(d) #인접값과의차이

help(sum)

#벡터에 논리 연산자 적용
 # 논리연산자 : <, <=, >, >=, ==, !=, |, &
d >= 5
d[d>=5]
sum(d>6) #6보다 큰값의 개수를 출력
sum(d[d>6]) # 6보다 큰값의 합계를 출력

condi <-  d > 5&d < 8
d[condi]

#여러개의 벡터를 합쳐 새로운 벡터 만들기
x <- c(1,2,3)
y <- c(4,5)
#단순희 x,y를 연결해서 출력
c(x,y)
z <- c(x,y)

### 리스트와 팩터(특별한 형태의 데이터)
#리스트
ds <- c(90,85,70,84)
my.info <- list(name='TOm', age=60, status=TRUE, score=ds)
my.info #리스트에 케릭터, 숫자, 불리안, 벡터를 너을수 있다

my.info[1]
my.info[[1]]
my.info$name
my.info$age
my.info$score

# 팩터 Factor
 # 문자형 데이터가 저장된 벡터의 일종
 #문자값들이 어떤 종류를 나타내는 값일때
 #예) 성별, 혈액형, 선호 정당
 #저장할 값들이 몇개의 종류로 정해져 있을때 
 #팩터를 사용한다.
 #방법: 문자형 벡터를 만든다, factor()함수를 이용해 변환한다.

bt <- c('A','B','B','O','AB') #문자형 벡터
bt.new <- factor(bt) #팩터 bt.new 정의
bt
bt.new
bt[5]
bt.new[5]

#팩터에 저장된 값의 종류를 출력
levels(bt.new)

#백터의 문자값을 숫자로 바꾸어 출력
as.integer(bt.new)

#팩터는 지정된 값의 종류 외에 다른 값이 들어오는 
#것을 막는다
bt[6] <- 'A'
bt[7] <- 'b'
bt
bt.new
bt.new[7] <- 'B'
bt.new
bt.new[8] <- 'C' # 또 다른 종류는 안 받는다.
bt.new



