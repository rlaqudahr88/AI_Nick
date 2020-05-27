


### 데이터시각화###

#트리맵
library(treemap)
data(GNI2014)
head(GNI2014)
treemap(GNI2014,
        index=c('continent', 'country'), # 계층구조의 기준설정(대륙-국가)
        vSize='population',              #타일의 크기
        vColor='GNI',                    #타일의 컬러 : GNI(Gross national income)
        type='value',                    #타일의 컬러링 방법
        bg.labels='yellow',              #레이블의 배경색
        title="World's GNI")             # 트리맵의 제목
GNI2014

st <- data.frame(state.x77)              # matrix --> dataframe 으로 바꾼거
head(st)
st <- data.frame(st, stname=rownames(st))      # 주 이름을 열 stname으로 추가
head(st)



#타일에 주 이름 표기: stname
#타일의 크기: Area
#타일의 컬러: Income
#차일의 컬러링 방법: value
#트리맵의 제목 : USA states area and income
treemap(st, index='stname',
        vSize='Area',
        vColor='Income',
        type='value',
        title='USA states area and income')

##버블 차트
st <- data.frame(state.x77)
symbols(st$Illiteracy, st$Murder, # 원의 x,y 좌표열
        circles= st$Population,   # 원의 반지름의 열
        inches=0.3,               # 원의 크기
        fg='white',               # 원의 테두리 색
        bg='lightgray',           # 원의 바탕색
        lwd=1.5,                   # 원의 테두리선 두꼐
        xlab='rate of Illiteracy',
        ylab = "crime(murder)rate" )

symbols(st$Illiteracy, st$Murder, 
        circles= st$Population,   
        inches=0.3,
        fg='white',
        bg='lightgray',          
        lwd=1.5,                  
        xlab='rate of Illiteracy',
        ylab = "crime(murder)rate",
        main='Illiteracy and Crime')
text(st$Illiteracy, st$Murder, #텍스트가 출력될 x,y 좌표
     rownames(st),             #출력할 텍스트
     cex=0.6,                  #폰트 크기
     col='brown')              #폰트 색


## 모자이크 플롯

head(mtcars)
mosaicplot(~gear+vs, # 대상 변수 지정. ~ 다음의 변수가 x축, +다음의 변수가 y축#
           data=mtcars,
           color=TRUE,      # y축 변수의 그룹별로 음영을 달리하여 표시한다.
           main='Gear and Vs'
           )

mosaicplot(~gear+vs,
           data=mtcars,
           color=c('darkgreen','green'),      
           main='Gear and Vs'
)

tbl <- table(mtcars$gear, mtcars$vs)
tbl
mosaicplot(tbl, color=T,main='Gear and Vs')

## ggplot 패키지
library(ggplot2)

month <-  c(1,2,3,4,5,6)
rain <- c(55,50,45,50,60,70)
df <- data.frame(month,rain)
df

ggplot(df, aes(x=month, y=rain))+ #그래프를 그랠 데이터를 지정
  geom_bar(stat= 'identity',        # 막대기의 높이: y 축에 해당하는 열의 값
         width=0.7,
         fill='steelblue')+        # 막대기의 색 지정
  ggtitle('월별 강수량')+
  theme(plot.title=element_text(size=25, face='bold', colour='steelblue'))+
  labs(x='월', y='강수량')+
  coord_flip() # 그래프를 가로 방향으로 출력

# 히스토그램

ggplot(iris, aes(x=Petal.Length))+
  geom_histogram(binwidth=0.5) #꽃잎의 길이를 0.5간격으로 나누라는 의미
  
#히스토그램(그룹별)
ggplot(iris, aes(x=Sepal.Width, fill=Species, color=Species))+
  geom_histogram(binwidth=0.5, position='dodge')+
  theme(legend.position='top')

#fill=Species : 막대 내부 색깔,
#color=Species: 막대 윤곽선
#position=dodge: 동일 구간의 막대들을 어떻게 그릴지 지정, dodge는 
#막대들을 겹치치 않고 병렬로 그리도록 지정

# 산점도
ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width))+
  geom_point()

#산점도(그룹)
ggplot(data=iris, aes(x=Petal.Length, y=Petal.Width, color=Species))+
  geom_point(size=3)+
  ggtitle('꽃잎의 길이와 폭')+
  theme(plot.title=element_text(size=25, face='bold', color='steelblue'))

#상자그림(boxplot) 기본
ggplot(data=iris, aes(y=Petal.Length))+
  geom_boxplot(fill='yellow')

#상자그림 (그룹별)
ggplot(data=iris, aes(y=Petal.Length, fill=Species))+
  geom_boxplot()

# 선그래프
year <- 1937:1960
cnt <- as.vector(airmiles)
df <- data.frame(year, cnt)
df

ggplot(data=df, aes(x=year, y=cnt))+
  geom_line(col='red')

## 차원축소 t-sne
# 패키지명 : Rtsne
library(Rtsne)
#iris[, -5] 에서 품종 정보를 제외
head(iris)
ds <- iris[,-5] #iris 에서 Species 정보를 제외
head(ds)

#중복 데이터 제거
dup <- which(duplicated(ds))
dup # 143번쨰 행 중복
ds <- ds[-dup,]
ds.y <- iris$Species[-dup] #중복을 제외한 품종 정보
ds.y
tsne <- Rtsne(ds, dims=2, perplexity=10) # t-sne 실행
# perplexity = 10 샘플개수

# 시각화
head(tsne)
head(tsne$Y)
df.tsne <- data.frame(tsne$Y)
head(df.tsne)

ggplot(df.tsne, aes(x=X1, y=X2, color=ds.y))+
  geom_point(size=2)

# 4차원 데이터를 3차원으로 변경, 산점도 작성
library(Rtsne)
library('car')
library('rgl')
library('mgcv')
tsne <- Rtsne(ds, dims=3, perplexity=10)
df.tsne <- data.frame(tsne$Y)
head(df.tsne)

# 3차원 산점도(회귀면)
scatter3d(x=df.tsne$X1,y=df.tsne$X2,z=df.tsne$X3)

# 회귀면 제거
scatter3d(x=df.tsne$X1,y=df.tsne$X2,z=df.tsne$X3, surface=FALSE)

# 점의 색을 품종별로 다르게
color <- c('red','green','blue')
point <- as.integer(ds.y)
scatter3d(x=df.tsne$X1,y=df.tsne$X2,z=df.tsne$X3, 
          point.col=color[point],
          surface=FALSE)



