
##지도와 데이터##
#1. R최신버전
#2. ggplot2 최신버전
#3. ggmap 패키지 설치
#4. 구글맵을 사용하기 위한 API 키 얻기
  #방법: 구글맵 플랫폼에 접속
library(ggplot2)
library(ggmap)
register_google(key='AIzaSyA-7WAJwy4RCXZ0yIgdihrjED5zMFOk4MQ') #구글키 등록

gc <-  geocode(enc2utf8('강남구')) #지점의 경도 위도
gc
cen <- as.numeric(gc) #경도 위도를 숫자로
cen

map <- get_googlemap(center=cen, zoom=15,
                     size=c(640,640),
                     maptype='roadmap' )
                #지도 생성
                      
ggmap(map)

#경도와 위도 값을 입력하여 지도 보기
#LA

cen <-  c(-118.233248, 34.085015)
map <- get_googlemap(center=cen)
ggmap(map)

#우리 학원
cen <-  c(127.029078, 37.493864)
map <- get_googlemap(center=cen, zoom=14)
ggmap(map)


## 지도위에 마커와 텍스트 표시
gc <- geocode(enc2utf8('용인'))
gc
cen <- as.numeric(gc)
map <- get_googlemap(center=cen, zoom=14, maptype = 'roadmap',
                     markers=gc)
ggmap(map)

# 마커 여러개와 텍스트

names <- c('용두암', '성산일출봉','정방폭포',
           '중문관광단지',
           '한라산1100고지',
           '차귀도')
addr <- c('제주도 용두암길 15', '서귀포시 성산읍 성산리','서귀포시 동홍동299-3',
         '서귀포시 중문도 2624-1',
         '서귀포시 색달동 산1-2','제주시 한경면 고산리 125')
gc <- geocode(enc2utf8(addr))

# 관광지 명칭과 좌표값으로 데이터프레임 생성
df <- data.frame(name=names, lon=gc$lon,lat=gc$lat)
df
cen <- c(mean(df$lon),mean(df$lat)) # 지도의 종심점
map <- get_googlemap(center=cen, maptype='roadmap',
                     zoom=10, size=c(640,640),
                     markers=gc)
ggmap(map)

# 명소 이름 지도 위에 표시하기
gmap <- ggmap(map)
gmap+geom_text(data=df, aes(x=lon, y=lat),
               size=3, label=df$name)


# 지도 위에 데이터 표시
# 데이터 준비
head(wind) # 미국 루이지애나 주 부근의 여러지점에서 측정한 바람 정보
nrow(wind)
sp <- sample(1:nrow(wind), 50)
sp
df <- wind[sp,]
head(df)

cen <- c(mean(df$lon),mean(df$lat))
gc <- data.frame(lon=df$lon,lat=df$lat)
head(gc)

# 측정위치에 마커 표시
map <- get_googlemap(center=cen, maptype='roadmap',zoom=6,
                     markers=gc)
ggmap(map)

# 풍속을 원의 크기로 표시하기
gmap <- ggmap(map)
gmap+geom_point(data=df,aes(x=lon, y=lat,size=spd), #spd 열의 값
                alpha=0.5,       # alpha:색의 투명도 0.5는반투명
                col='blue')+
  scale_size_continuous(range=c(1,14)) #원의 크기 조절 1=min 14=max

