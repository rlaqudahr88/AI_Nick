
library(wordcloud)
library(RColorBrewer)
library(KoNLP)
library(rJava)

#Q1-1
setwd("C:/Users/user/Desktop/BigDataCourse/R")
text <- readLines("ex_10-1.txt", encoding = "UTF-8") # 파일읽기

# 빈도수 높은데 워드클라우드에 없으면 사용자 사전에 추가
buildDictionary(ext_dic = "woorimalsam",  
                user_dic=data.frame("정치", "ncn"),
                replace_usr_dic = T)
noun <- sapply(text,extractNoun, USE.NAMES=F)
noun2 <- unlist(noun)            # 추출된 명사 통합 
noun
noun2

# 무의미한 단어 제거
noun2 <- noun2[nchar(noun2)>1]    # 1글자 단어 제거

wordcount <- table(noun2)         # 단어 빈도수 계산
wordcloud(names(wordcount),
          freq=wordcount,
          scale=c(6,0.7),
          min.freq=3,
          random.order=F,
          rot.per=.1,
          colors=pal2)


#Q1-2
text <- readLines("ex_10-2.txt", encoding = "UTF-8") # 파일읽기

# 빈도수 높은데 워드클라우드에 없으면 사용자 사전에 추가
buildDictionary(ext_dic = "woorimalsam",  
                user_dic=data.frame("정치", "ncn"),
                replace_usr_dic = T)
noun <- sapply(text,extractNoun, USE.NAMES=F)
noun2 <- unlist(noun)            # 추출된 명사 통합 
noun
noun2

# 무의미한 단어 제거
noun2 <- noun2[nchar(noun2)>1]    # 1글자 단어 제거

wordcount <- table(noun2)         # 단어 빈도수 계산
wordcloud(names(wordcount),
          freq=wordcount,
          scale=c(6,0.7),
          min.freq=3,
          random.order=F,
          rot.per=.1,
          colors=pal2)


#Q1-3
text <- readLines("ex_10-3.txt", encoding = "UTF-8") # 파일읽기

# 빈도수 높은데 워드클라우드에 없으면 사용자 사전에 추가
buildDictionary(ext_dic = "woorimalsam",  
                user_dic=data.frame("정치", "ncn"),
                replace_usr_dic = T)
noun <- sapply(text,extractNoun, USE.NAMES=F)
noun2 <- unlist(noun)            # 추출된 명사 통합 
noun
noun2

# 무의미한 단어 제거
noun2 <- noun2[nchar(noun2)>1]    # 1글자 단어 제거

wordcount <- table(noun2)         # 단어 빈도수 계산
wordcloud(names(wordcount),
          freq=wordcount,
          scale=c(6,0.7),
          min.freq=3,
          random.order=F,
          rot.per=.1,
          colors=pal2)

#Q1-02) 스티브 잡스의 스탠포드 대학 졸업식 연설문에 대해 워드클라우드를 작성하시오.
#* 예제소스 : ex_10-4.txt

text <- readLines("ex_10-4.txt", encoding = "UTF-8") # 파일읽기

# 빈도수 높은데 워드클라우드에 없으면 사용자 사전에 추가
buildDictionary(ext_dic = "woorimalsam",  
                user_dic=data.frame("정치", "ncn"),
                replace_usr_dic = T)
noun <- sapply(text,extractNoun, USE.NAMES=F)
noun2 <- unlist(noun)            # 추출된 명사 통합 
noun
noun2

# 무의미한 단어 제거
noun2 <- noun2[nchar(noun2)>1]    # 1글자 단어 제거

wordcount <- table(noun2)         # 단어 빈도수 계산
wordcloud(names(wordcount),
          freq=wordcount,
          scale=c(6,0.7),
          min.freq=3,
          random.order=F,
          rot.per=.1,
          colors=pal2)




#Q1-03) 오바마 대통령의 대통령 당선 연설문에 대해 워드클라우드를 작성하시오.
#* 예제소스 : ex_10-5.txt

text <- readLines("ex_10-5.txt", encoding = "UTF-8") # 파일읽기

# 빈도수 높은데 워드클라우드에 없으면 사용자 사전에 추가
buildDictionary(ext_dic = "woorimalsam",  
                user_dic=data.frame("정치", "ncn"),
                replace_usr_dic = T)
noun <- sapply(text,extractNoun, USE.NAMES=F)
noun2 <- unlist(noun)            # 추출된 명사 통합 
noun
noun2

# 무의미한 단어 제거
noun2 <- noun2[nchar(noun2)>1]    # 1글자 단어 제거

wordcount <- table(noun2)         # 단어 빈도수 계산
wordcloud(names(wordcount),
          freq=wordcount,
          scale=c(6,0.7),
          min.freq=3,
          random.order=F,
          rot.per=.1,
          colors=pal2)


#Q 3. 공공데이터포털에서 서울시 서대문구의 유치원 현황(2014년 9월) 
#자료를 다운로드하여 유치원의 위치를 지도상에 마커로 표시하시오.
#(유치원 주소를 위도와 경도로 변환하지 못하는 곳도 있는데, 이곳은 마커 표시
#대상에서 제외한다.)


library(ggplot2)
library(ggmap)
register_google(key='AIzaSyA-7WAJwy4RCXZ0yIgdihrjED5zMFOk4MQ')
setwd("C:/Users/user/Desktop/BigDataCourse/R")
kinder <- read.csv('유치원_현황.csv', header = TRUE)
head(kinder)
kinder$소.재.지
kinder$유.치.원.명
acc <- subset(kinder)
acc
#a <- aggregate(acc$발생건수, by=list(시군구=acc$시군구), FUN=sum)
#a <- aggregate(acc$발생건수, by=list(시도=acc$시도), FUN=sum)

#colnames(a)[2] <- '발생건수'
#a
addr <- acc[,3]
addr
gc <- geocode(enc2utf8(addr))
gc

# 측정위치에 마커 표시
cen <-  c(mean(gc$lon),mean(gc$lat)) # 지도의 종심점
map <- get_googlemap(center=cen, zoom=13, maptype = 'roadmap',
                     markers=gc)
ggmap(map)

###########################################
df <- data.frame(lon=gc$lon,lat=gc$lat)
df
head(a['발생건수'])
new <- merge(df,a['발생건수'], by=0, all=TRUE)
head(new)



# 풍속을 원의 크기로 표시하기
gmap <- ggmap(map)
gmap+geom_point(data=new,aes(x=lon, y=lat,size=발생건수), #spd 열의 값
                alpha=0.5,       # alpha:색의 투명도 0.5는반투명
                col='red')+
  scale_size_continuous(range=c(1,14)) #원의 크기 조절 1=min 14=max


# 4. 공동데이터포털에서 '2016년도 시도 시군구별 교통사고' 
# 통계를 다운로드하시오. 다운로드한 파일 중에서'2016년_시도_시군구별_월별_교통사고.csv'에 
# 대해 다음 물음에 답하세요.
# 01) 월별 발생건수, 사망자수, 부상자수를 집계하여 출력하시오.
# 02) 시도별 발생건수, 사망자수, 부상자수를 집계하여 출력하시오.

library(ggplot2)
library(ggmap)
register_google(key='AIzaSyA-7WAJwy4RCXZ0yIgdihrjED5zMFOk4MQ')
setwd("C:/Users/user/Desktop/BigDataCourse/R")
accident <- read.csv('2016년_시도_시군구별_월별_교통사고.csv')
accident
head(accident)
accident$월
accident$발생건수
acc <- subset(accident, select=c('월','발생건수','사망자수','부상자수'))
acc
#a <- aggregate(acc$발생건수, by=list(시군구=acc$시군구), FUN=sum)
a <- aggregate(cbind(acc$발생건수,acc$사망자수,acc$부상자수), by=list(월=acc$월), FUN=sum)
a
names(a)[2] <- "발생건수"
names(a)[3] <- "사망자수"
names(a)[4] <- "부상자수"
a
sum(a$발생건수)

# 02) 시도별 발생건수, 사망자수, 부상자수를 집계하여 출력하시오.

accident <- read.csv('2016년_시도_시군구별_월별_교통사고.csv')
accident
head(accident)
accident$시도
accident$발생건수
acc <- subset(accident, select=c('시도','발생건수','사망자수','부상자수'))
acc
#a <- aggregate(acc$발생건수, by=list(시군구=acc$시군구), FUN=sum)
a <- aggregate(cbind(acc$발생건수,acc$사망자수,acc$부상자수), by=list(시도=acc$시도), FUN=sum)
a
names(a)[2] <- "발생건수"
names(a)[3] <- "사망자수"
names(a)[4] <- "부상자수"
a


# 5. 국가통계포털 사이트에서 '2016년도 전국 음식점 정보 통계'를 가져와서
# '채식전문점'이 위치한 시도를 출력하세요.

food <- read.csv('한국관광공사_전국_음식점_정보_20160906.csv')
food
head(food)

acc <- subset(food, select=c('카테고리3','지역명'))
acc
a <- subset(acc, 카테고리3=='채식전문점')
a
a[!duplicated(a[2]),] #중복은 뺸다.

#####################################
newa <- aggregate(a$지역명, by=list(카테고리3=a$카테고리3), FUN=unique)
newa
acc <- subset(a, select=c('카테고리3','지역명', FUN=unique))
acc
a
a[!duplicated(a[2]),] #중복은 뺸다.






