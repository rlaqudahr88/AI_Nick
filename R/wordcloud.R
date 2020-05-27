#install.packages('rJava')
#install.packages('hash')
#install.packages('tau')
#install.packages('Sejong')
#install.packages('RSQLite')
#install.packages('devtools')


#install.packages("rJava")
#source("https://install-github.me/talgalili/installr")
#installr::install.java()




install.packages("https://cran.r-project.org/src/contrib/Archive/KoNLP/KoNLP_0.80.2.tar.gz", repos = NULL , type = "source",INSTALL_opts = c('--no-lock'))

Sys.setenv(JAVA_HOME='C:/Program Files (x86)/Java/jre1.8.0_251')


library(wordcloud)
library(RColorBrewer)
library(KoNLP)


install.packages("rJava")
source("https://install-github.me/talgalili/installr")
installr::install.java()
library(rJava)



setwd("C:/Users/user/Desktop/BigDataCourse/R")
text <- readLines("mis_document 27-05.txt", encoding = "UTF-8") # 파일읽기
buildDictionary(ext_dic = "woorimalsam")                  # '우리 말씀' 한글사전 읽기 
pal2 <- brewer.pal(8, "Dark2")                            # 명사 추출
noun <- sapply(text, extractNoun, USE.NAMES=F)            #추출된 명사 출력
noun








