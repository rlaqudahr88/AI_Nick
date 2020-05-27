
z <- matrix(1:20, nrow=4,ncol=5)
z
z2 <- matrix(1:20, nrow=4,ncol=5, byrow=T)
z2

# 기존 매트릭스에 벡터를 추가하여 새로운 매트릭스 만들기
x <-  1:4
y <- 5:8
z <- matrix(1:20, nrow=4, ncol=5)

#x와 y를 열 방향으로 결합하여 매트릭스 생성
m1 <- cbind(x,y) # c - column 방향으로 결합
m1
m2 <- rbind(x,y) # r - row 방향으로 결합
m2

#매트릭스 m2와 벡터 x를 행 방향으로 결합
m3 <- rbind(m2,x)
m3

#매르릭스 z와 벡터 x를 열방향으로 결합
m4 <- cbind(z,x)
m4

##매트릭스에서 값 추출
 # 인덱스값을 이용하여 추출
z <-  matrix(1:20, nrow=4, ncol=5)
z
#2행 3열에 있는 값을 추출
z[2,3]
#1행 4 열에 있는 값 추출
z[1,4]

#2행에 있는 모든 값 추출
z[2,]

#4열에 있는 모든 값 추출
z[,4]

#매트릭스에서 여러개의 값을 동시에 추출하기
 #2행의 값 중 1~3열에 있는 값
z[2,1:3]
 #1행의 값중 1, 2, 4 열에 있는 값
z[1,c(1,2,4)]
 #1, 2행의 있는 모든 값
z[1:2,]

#1,4열에 있는 모든 값
z[,c(1,4)]


#매트릭스의 행과 열에 이름 지정
score <- matrix(c(90,85,69,78,
         85,96,49,95,
         90, 80, 70, 60),
       nrow=4, ncol=3)
score
rownames(score) <- c('John', 'Tom','Mark','Jane')
colnames(score) <- c('English','Math','Science')
score

# 행과 열에 지정한 이름을 이용하여 매트릭스 값 추출하기
score['John','Math']  #John의 수학 성적
# Tom의 수학, 과학 성적
score['Tom',c('Math', 'Science')]
# Mark의 모든 과목 성적
score['Mark',]
#모든 학생의 영어성적
score[,'English']
rownames(score) # score의 헹의 이름
#score의 열의 이름
colnames(score)
#score의 열의 이름중 두번째 값
colnames(score)[2]






