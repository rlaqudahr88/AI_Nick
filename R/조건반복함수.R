
#basic if-else
job.type <- 'A'
if(job.type == 'B'){
  bonus <- 200
}else{
  bonus <- 100
}
print(bonus)

job.type <- 'B'
bonus <- 100
if(job.type=='A'){
  bonus <- 200
}
print(bonus)

# 다중 if-else 문
score <- 85
if(score >90){
  grade <- 'A'
}else if(score >80){
  grade <- 'B'
}else if(score>70){
  grade <- 'C'
}else{
  grade <- 'F'
}
print(grade)

# 논리연산자(and, or) 사용

a <- 10
b <- 20
if(a>5 & b>5){ # and사용
  print(a+b)
}
if(a>5|b>10){ # or 사용
  print(a*b)
}

# ifelse 문
#ifelse(비교조건, 조건이 참일때 선택할 값, 
#           조건이 거짓일때 선택할 값
#           )
if(a>b){
  c <- a
}else{
  c <- b
}
print(c)

d <- ifelse(a>b,a,b)
print(d)


# for 문
# for(반복변수 in 반복할 범위){
#   반복할 명령문(들)
# }

for(i in 1:5){
  print(i)
  print(' *')
}

#구구단 출력
for(i in 1:9){
  cat('2 *', i, '=', 2*i, '\n')
}

# for문 안에 if문
 # 짝수 확인 : 나머지 연산자 %%
for(i in 1:20){
  if(i %% 2 ==0)
  print(i)
}

# 1~100까지 합을 출력해라
sum <- 0
for(i in 1:100){
  sum <- sum+i
}
print(sum)

#iris 에서 꽃잎의 길이에 따른 분류 작업
iris  #먼저 일딴 보자
norow <- nrow(iris)#iris의 행의 수

# 꽃잎의 길이에 따라 레이블 결정
mylabel <- c() # 비어있는 벡터 선언
for(i in 1:norow){
  if(iris$Sepal.Length[i]<=1.6){
    mylabel[i] <- 'L'
  }else if(iris$Sepal.Length[i]>5.1){
    mylabel[i] <- 'H'
  }else{
    mylabel[i] <- 'M'
  }
}
print(mylabel) #label 출력

#꽃잎의 길이와 레이블 결합 dataframe로 만들자
newds <- data.frame(iris$Sepal.Length, mylabel)
newds

## while문
#while(비교조건){
#   반복할 명령문
#}
# while문으로 1에서 100까지 합을 구하라

sum <- 0
i <- 0
while(i<=100){
  sum <- sum +i
  i <- i + 1
}
print(sum)

#break
sum <- 0
for(k in i:10){
  sum = sum + i
  if(i>5) break
}
sum

#next
sum <- 0
for(j in 1:10){
  if(j%%2==0) next
  sum <- sum + j
}
sum

head(iris)
## apply() 함수
# apply(데이터셋, 행/열방향 지정, 적용함수)
# row 방향으로
apply(iris[, 1:4],1,mean) #row 방향으로 함수 적용
apply(iris[, 1:4],2,mean) #col 방향으로 함수 적용

# 유사함수: lapply(), sapply(), tapply(), mapply()

## 사용자 정의 함수
#함수명 <- function(매개변수 목록){
#  실행할 명령문
#  return(함수의 실행 결과)
#}

# 두 인자중 큰값 찾기
mymax <- function(x,y){#초기에 function(x,y=7)을 쓸수도 있다.
  
  num.max <- x
  if(y>x){
    num.max <- y
  }
  
  return(num.max)
}
mymax(5,7)
mymax(100,7)


# myfunc.R 에 저장된 함수를 이용 하는 방법
setwd('C:/Users/TJ/Desktop/Nick_Study/R')
source('myfunc.R') # myfunc.R 안에 있는 함수 실행

# 함수사용
mydiv(20,4)
mydiv(mydiv(20,4),5)


# 조건에 맞는 데이터의 위치 찾기
#which()
score <- c(76,84,69,50,95,60,82,71,88,84)

which(score==69)#성적이 69인 학생은 몇번째에 있나
which(score>=85)# 성적이 85 이상인 학생은 몇 번째에 있나

#최고점수는 몇 번째에 있나
max(score) #최고 점수
which.max(score)

#최저 점수는 멏 번째에 있나
which.min(score)

idx <- which(score<=60) # 성적이 60 이하인 값들의 인덱스
score[idx] <- 61 # 성적이 60 이하인 값들은 61점으로 상향시킨다.
score

#성적이 80이상인 값들만 추출해서 score.high에 저장
cutline <- which(score>80)
score.high <- score[cutline]
score.high

score.high2 <- subset(score, score>80)
score.high2

score[which(score>90)]

# 꽃잎의 길이가 5.0 이상인 값들만 추출하요 
# iris.big에 넣고 보여주시오

head(iris$Petal.Length)

idx <- which(iris$Petal.Length> 5.0)
idx # found the index
iris.big <- iris[idx,]
iris.big
iris.big['Petal.Length']



# 1~4열의 값 중 5보다 큰 값의 행과 열의 위치
# dataframe안에 특정 ㄱ밧의 행과 열의; 위치를
#알고 싶을때
# arr.ind = TRUE 를 추가 한다.
idx <- which(iris[,1:4] > 5.0, arr.ind=TRUE)









