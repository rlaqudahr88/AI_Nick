
###다중변수 자료의 탐색
# 1. 산점도
# 2. 상관분석
# 3. 선 그래프
# 4. 실습


## 1. 산점도(Scatter Plot)

#두변수 사이의 산점도

head(mtcars)

wt <- mtcars$wt
mpg <- mtcars$mpg
plot(wt, mpg,                    # 2 개 변수
     main='Car Weight-mpg',      # 제목
     xlab='Car Weight',          # x축 레이블
     ylab='Miles Per Gallon',    # y축 레이블
     col='red',                  # point 의 color
     pch=19)                     # point 의 종류

# plot(mtcars$wt,mtcars$mpg, ....... )
# plot(mtcars[, c('wt','mpg)], ............)
# plot(mpg~wt, data=mtcars, ...........)

# 여러 변수들 간의 산점도
vars <- c('mpg', 'disp','drat','wt') # 대상 변수
target <- mtcars[,vars]
target
pairs(target,
      main='Multi plots')

# 그룹 정보가 있는 두 변수의 산점도

head(iris)
iris.2 <- iris[,3:4]
point <- as.numeric(iris$Species) # 포인트 모양
color <- c('red', 'green','blue') # 포인트 컬러

plot(iris.2,
     main='Iris plot',
     pch=c(point),
     col=color[point])

## 상관분석
# -1 <= r <= 1

# 음주정도와 혈중알콜 농도에 대한 상관 분석

beers = c(5,2,9,8,3,7,3,5,3,5)
bal = c(0.1,0.03,0.19,0.12,0.04,0.0095,0.07,0.06,0.02,0.05)
# bal - Blood Alcohol Level
tbl = data.frame(cbind(beers,bal))
tbl; class(tbl)
plot(bal~beers,data=tbl)   #산점도
res=lm(bal~beers,data=tbl) #회귀식 도출
abline(res)                #회귀 선그리기
cor(beers,bal)             #상관성 분석 시행


##tbl = data.frame(cbind(beers,bal))
#data.frame : 데이터를 테이블 형태로 관리
#cbind () : 두 벡터를 컬럼 열 방향으로 합친다
#(cf.rbind () : 두 벡터를 행 방향으로 합친다)

##선 그래프
#시계열 자료(times series data)
#월별 지각생 통계

month <- 1:12
month
late <- c(5,8,7,9,4,6,
          12,13,8,6,6,4)
plot(month, late,
     main='지각생 통계',
     type='l',#그래프의 종류를 선택(알파벳)
     lty=1,#선의 종류(line type) 선택
     #선의 굵기 선택
     lwd=1,
     xlab='Month',
     ylab='Late count')

#복수의 선그래프 작성
late1 <- c(5,8,7,9,4,6,12,13,8,6,6,4)
late2 <- c(4,6,5,8,7,8,10,11,6,5,7,3)

plot(month,late1,
     main="Late Students",
     type='b',
     lty=1,
     col='red',
     xlab='Month',
     ylab='Late count',
     ylim=c(1,15)) #y축 값의 (상한, 하한)
lines(month, late2, type='b', col='blue')

##실습
#BostonHousing 데이터셋
# crime: 지역의 1인당 범죄율
# rm: 주택1가구당 방의 개수
# dis: 보스턴의 5개 직업 센터까지의 거리
# tax: 재산세율
# medv: 주택가격

# 탐색적 데이터 분석
# 1단계: 분석 대상 데이터셋 준비
library(mlbench)
data('BostonHousing')
BostonHousing
head(BostonHousing)

BostonHousing[,c('crim','rm','dis','tax','medv')]
myds <- BostonHousing[,c('crim','rm','dis','tax','medv')]
head(myds)

#2단계: 변수 추가 grp(주택가격을 상,중, 하 분류)
grp <-  c()
for(i in 1:nrow(myds)){ #1 부터 myds 개수만큼 돌아라
  if(myds$medv[i] > 25.0){
    grp[i] <- 'H'
  }else if(myds$medv[i]<=17.0){
    grp[i] <- 'L'
  }else{
    grp[i] <- 'M'
  }
  
}
myds
grp <- factor(grp) # 문자 벡터를 팩터 타입으로 변경
grp
summary(myds)

#레밸의 순서를 H, L, M --> H,M,L 로 변경
grp <- factor(grp, levels=c('H','M','L'))
grp
myds <-  data.frame(myds, grp)#myds에 grp열 추가
head(myds)

# 3단계: 데이터셋의 형태와 기본 내용 파악
str(myds)

myds <- myds[,-7] # 마지막 생선 지우기
myds
head(myds)

# 4단계: 히스토그램에 의한 관측 값의 분포 확인
# 그룹정보(grp)를 제외한 나머지 5개의 변수에 대해 관측값들의 분포 확인

par(mfrow=c(2,3)) #2*3 가상화면 분할
for(i in 1:5){
  hist(myds[,i], main=colnames(myds)[i], col='yellow')
}

# 5 단계: 상자그림에 의한 분포 확인
for(i in 1:5){
  boxplot(myds[,i], main=colnames(myds)[i])
}

# 6단계: 각 변수별 그룹에 대한 분포
boxplot(myds$crim~myds$grp, main='주택 가격별 1인당 범죄율')

# 주택가격별 방개수 분포
boxplot(myds$rm~myds$grp, main='주택가격별 방개수')

#7 단계: 산점도를 통한 변수간 상관관계 확인
head(myds)

pairs(myds[,-6])
pairs(myds[,1:5], main='산점도')

# 8 단계: 그룹정보를 포함한 변수간 상관관계 확인
point <- as.integer(myds$grp)
color <-c('red','green','blue')
pairs(myds[,1:5],
      main='산점도(그룹포함)',
      pch=point,
      col=color)

# 9단계:변수간 상관계수 확인
cor(myds[,1:5])




