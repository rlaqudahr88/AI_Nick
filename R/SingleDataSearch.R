##단일변수 자료의 탐색

# 1) 자료의 특성 : 범주형(질적), 연속형(양적)
# 범주형은 주로 성별, 혈액형, 색깔, 찬반여부 -> 계산할의미가 없음 
#연속형은 : 몸무게, 키, 온도, 자녀의 수 등 -> 계산이 가능

# 2) 변수의 개수에 따른 분류
# 단일변수 자료(일변량 자료): 하나의 변수로만 구성된 자료
# 다중변수 자료(다변량 자료): 두개이상의 변수로 구성된 자료

# 1. 도수분포표 작성(frequency distribution table)
favorite <- c('WINTER', 'SUMMER','SPRING','SUMMER','SUMMER','FALL','FALL',
  'SUMMER','SPRING','SPRING')
favorite

#도수분포표 계산
table(favorite)

#비율 출력 (ratio or percentage in decimal)
table(favorite)/(length(favorite))

#2. 맥대 그래프 작성
ds <- table(favorite)
ds
barplot(ds, main='faorite season')

#2-1. 도수분포표데이터의 순서 정렬
ds[c(2,3,1,4)]
ds[c('SPRING','SUMMER','FALL','WINTER')]
table(favorite)[c('SPRING','SUMMER','FALL','WINTER')]
ds.new <- table(favorite)[c('SPRING','SUMMER','FALL','WINTER')]
barplot(ds.new, main='favorite season')

# 3. 원그래프 작성
ds
pie(ds, main='favorite season')

# 4. 숫자로 표현된 범주형 자료(1=초록,2=빨강,3=파랑)

favorite.color <- c(2,3,2,1,1,
                    2,2,1,3,2,
                    1,3,2,1,2)
ds <- table(favorite.color)
ds
# 1) 단순한 막대그래프
barplot(ds, main='favorite color')
# 2) 색을 지정한 막대그래프
colors <- c('green','red','blue')
names(ds) <- colors
ds
barplot(ds, main='favorite color', col=colors)

# 3) 색을 지정한 원그래프
pie(ds, main='favorite color', col=colors)
# adding percentage
pct <- round(ds/sum(ds)*100)
lbls <- colors
lbls <- paste(lbls, pct) # add percents to labels
lbls <- paste(lbls,"%",sep="") # ad % to labels
pie(ds,labels=lbls, main='favorite color', col=colors)
ds

## 연속형 자료 탐색
weight <- c(60,62,64,65,68,69)
weight
weight.heavy <- c(weight, 120)
weight.heavy

#평균
mean(weight)
mean(weight.heavy)

#중앙값
median(weight)
median(weight.heavy)

#절사평균(상위하위 20% 제외)
mean(weight, trim=0.2)
mean(weight.heavy, trim=0.2)

# 사분위수
mydata <- c(60,62,64,65,68,69,120)
quantile(mydata)

# 10% 단위로 구간을 나누어 계산
quantile(mydata, (0:10)/10)

summary(mydata) # 차라리 summary를 써서 보는게 편하다

#산포
var(mydata) #분산
#표준편차 standard deviation
sd(mydata)
#값의 범워
range(mydata)
#최대값, 최소값의 차이
diff(range(mydata))

# 히스토그램
cars
dist <- cars[,2] #distance
dist
hist(dist, #data
     main='Histogram for Distance', #재목
     xlab = 'distance', #x label
     ylab= 'Frequency', # y label
     border='blue',     # bar outer color
     col='green',       # bar inner color
     las=1,             # rotate x y axis label(0~3)
     breaks=5)          # number of x axis bars


# Boxplot

boxplot(dist, main='자동차 제동거리')
# 박스 안이 50% 그안에 라인이 중간값
# 박스 아래 줄이 25%. 박스 위줄이 75%


boxplot.stats(dist)
# $stats: 정상법위 자료의 4분위수에 해당하는 값 표시
# $n : 자료에 있는 관측 값의 개수, 총 50개의
# 관측값을 저장하고 있다.
# $conf: 중앙값에 관련된 신뢰구간을 의미
# $out: 특이값의 목록 outlier

# 상자그림 그룹
iris
boxplot(Petal.Length~Species, data = iris, 
        main='품종별  꽃잎의 길이')

boxplot(iris$Petal.Length~iris$Species, 
        main='품종별  꽃잎의 길이')

# 한 화면에 그래프 여러개 출력하기
# 3개로 화면 분할
par(mfrow=c(1,3))
mtcars
barplot(table(mtcars$carb), main='Barplot of Carburetors',
        xlab='#of carburetors',
        ylab='frequency',
        col='blue')
barplot(table(mtcars$cyl), main='Barplot of Cylinder',
        xlab='#of cylinder',
        ylab='frequency',
        col='red')
barplot(table(mtcars$gear), main='Barplot of Gear',
        xlab='#of gear',
        ylab='frequency',
        col='green')

par(mfrow=c(1,1)) # 가상화면 분할 해제










