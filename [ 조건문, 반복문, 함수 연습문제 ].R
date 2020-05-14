
#[ 조건문, 반복문, 함수 연습문제 ]

#1.
#1)
apply(iris[,1:4],1,sum)
#2)
apply(iris[,1:4],2,sum)

#2.
mtcars
#1)
apply(mtcars[,1:4],2,sum)
#2)
apply(mtcars[,1:4],2,max)
#3)
apply(mtcars[,1:4],2,mean)

#3
v1 <- c(7,1,2,8,9)
x <- 0
maxmin <- function(x){
  maxmin <- list(max(v1), min(v1)) 
}
result <- maxmin(v1)
result

maxmin <- function(x){
  maxmin <- list(max(iris[,1]), min(iris[,1])) 
}
result <- maxmin(iris[,1])
result

#4
weight <- c(69, 50, 55, 71, 89, 64, 59, 70, 71, 80)
#1)
which.max(weight)
#2)
which.min(weight)
#3)
idx <- which(weight>60 & weight<70)
weight[idx]
#4)
idx <- which(weight<60)
weight.2 <- weight[idx]
weight.2

#5
#1)
which(iris$Petal.Length==max(iris['Petal.Length']))
iris[119,]
#2)
idx <- which(iris$Petal.Width>=0.3 & iris$Petal.Width<=0.4)
iris[idx,]
