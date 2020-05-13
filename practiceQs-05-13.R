setwd("C:/Users/user/Desktop/BigDataCourse/R")
air <- read.csv("airquality.csv", header=T)
air
head(air)
state.x77
#1. state.x77를 st 에 저장하시오
st <- data.frame(state.x77)
#2.st 의 내용을 보이시오
st
#3.st 의 열 이름을 보이시오
colnames(st)

#4.st 의 행 이름을 보이시오
rownames(st)

#5.st 의 행의 개수와 열의 개수를 보이시오
nrow(st)
ncol(st)

#6.st 의 요약정보를 보이시오
str(st)
#7.st 의 행별 합계와 평균을 보이시오
rowSums(st) #행별 합계
rowMeans(st) #행별 평균

#8.st 의 열별 합계와 평균을 보이시오
colSums(st) #행별 합계
colMeans(st) #행별 평균

#9. Florida주의 모든 정보를 보이시오
st["Florida",]

#10. 50개 주의 Income 정보만 보이시오
st["Income"]

#11.texas 주의 면적 (area) 을 보이시오
st['Texas',"Area"]

#12.ohio 주의 인구 (population) 와 수입 ( 을 보이시오
st['Ohio',c("Population" ,"Income")]

#13.인구가 5000 이상인 주의 데이터만 보이시오
st.pop <- subset(st, Population>5000)
st.pop

#14. 수입이 4500 이상인 주의 인구 , 수입 , 면적을 보이시오

st.income <- subset(st, Income>4500)
st.income
st.income[,c('Population','Income','Area')]


#15.수입이 4500 이상인 주는 몇 개인지 보이시오
rownames(st.income)

#16.전체면적 (area)이 100000 이상이고 
#결빙일수 (frost) 가 120 이상인 주의
#정보를 보이시오

st.1 <- subset(st, Area>100000 &Frost>120)
rownames(st.1)

#17 인구(Population)가 2,000 미만이고, 
# 범죄율(Murder)이 12 미만인 주의 정보를 출력하시오.
st.17 <- subset(st, Population<2000 &Murder<12)
rownames(st.17)

#18. 문맹률 (illiteracy) 이 2.0 이상인 주의 \
#평균 수입은 얼마인가
colMeans(subset(st, Illiteracy<2.0)["Income"])

#19.문맹률 (illiteracy) 이 2.0 미만인 주와 
#2.0 이상인 주의 평균 수입의 차이를 보이시오
st.19_1 <- colMeans(subset(st, Illiteracy<2.0)['Income'])
st.19_2 <- colMeans(subset(st, Illiteracy>2.0)['Income'])

dif_mean <- st.19_1-st.19_2

#20. 기대수명 life.exp 이 가장 높은 주는 어디인가
a <- max(st['Life.Exp'])
Life <- subset(st, Life.Exp==73.6)
rownames(Life)

#21. Pennsylvania 보다 수입이 높은 주들을 보이시오
st["Pennsylvania",]
st.21 <- subset(st, Income>4449)
rownames(st.21)




