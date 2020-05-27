##[자료탐색(다변량)연습문제]
#1. R에서 제공하는 cars데이터셋을 이용하여 속도(speed)와 제동거리(dist)에 대한 산점도을 작성하고, 
#두 변수 간의 상관관계를 설명하시오.
#(x축:speed, y축:dist)

cars
par(mfrow=c(1,1))
plot(cars$speed, cars$dist,
     main='Cars speed / dist',
     xlab='Speed',
     ylab='Dist',
     col='red',
     pch=9)

#2. R에서 제공하는 pressure 데이터셋을 이용하여 온도(temperature)와 기압(pressure)에 대한 산점도를 작성하고, 
#두 변수간의 상관 관계를 설명하시오.(x축:temperature, y축:pressure)

pressure
plot(pressure$temperature, pressure$pressure,
     main='temp / pressure',
     col='red',
     pch=9)
pairs(pressure[,1:2], main='산점도')
cor(pressure[,1:2])
# temperature 가 올라갈수록 pressure 도 올라간다


#3. R에서 제공하는 trees 데이터셋에 대해 다음 문제를 해결하기 위한 R코드를 작성하시오.
##1) 나무의 지름(Girth)과 높이(Height)에 대해 산점도와 상관계수를 보이시오.
trees
plot(trees$Girth, trees$Height,
     main='Girth / height',
     col='red',
     pch=9)
pairs(trees[,1:2], main='산점도')
cor(trees[,1:2])

##2) trees 데이터셋에 존재하는 3개 변수 간의 산점도와 상관계수를 보이시오.

pairs(trees[,1:3], main='산점도')
cor(trees)





#4. R에서 제공하는 AirPassengers 데이터셋은 1949년~1960년 사이의 항공승객수를 월별로 나타낸 것이다. 
#AirPassengers 데이터셋에서 1949, 1955, 1960년의 월별 승객수를 선그래프로 작성하는데, 3개년도의 선의 색을 다르게 하시오.
#(현재는 AirPassengers 데이터셋에서 직접 데이터를 추출할 수 없으니 AirPassengers 데이터셋을 보고 필요한 자료를 입력하여 사용한다.)

AirPassengers

myts <- ts(AirPassengers, start=c(1949, 1), end=c(1960, 12), frequency=1)
myts


plot(Jan~Dec,data=AirPassengers[c('1949','1955','1960'),])

df <- as.ts(AirPassengers)

AirPassengers[,2]
class(AirPassengers)
library(xts)
datx <- as.xts(AirPassengers)
df   <- data.frame(AirPassengers)

df
class(df$date)
print(df)
#5. R에서 제공하는 USAccDeaths 데이터셋은 1973년~1978년 사이의 사고 사망자 숫자를 월별로 나타낸 것이다. 
#USAccDeaths 데이터셋에서 1973, 1975, 1977년의 월별 사망자 숫자를 선그래프로 작성하는데, 3개년도의 선의 색을 다르게 하시오.
