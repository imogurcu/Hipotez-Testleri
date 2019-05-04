




## Hipotez 
## H0 : M1 = M2
## H1 : M1 != M2


iki_ornek_veri <- data.frame(
  
  A = c(30,27,21,27,29,30,20,20,27,32,35,22,24,23,25,27,23,27,23,
        25,21,18,24,26,33,26,27,28,19,25),
  B = c(37,39,31,31,34,38,30,36,29,28,38,28,37,37,30,32,31,31,27,
        32,33,33,33,31,32,33,26,32,33,29)
)


library(funModeling)
library(tidyverse)

profiling_num(iki_ornek_veri)


ggplot(iki_ornek_veri,
       aes(A,B))+
       geom_boxplot()

A <- data.frame(degerler = iki_ornek_veri$A, sinif = "A")
B <- data.frame(degerler = iki_ornek_veri$B, sinif = "B")


AB <- rbind(A,B)

ggplot(AB, aes(sinif, degerler, fill = sinif))+
  geom_boxplot()


## Normalligin Incelenmesi 


ggplot(AB, aes(degerler, fill = sinif))+
  geom_histogram(color = "black",
                 binwidth = 5,
                 alpha = 0.5)+
  facet_grid(sinif ~.)



ggplot(AB, aes(degerler, fill = sinif))+
  geom_histogram(aes(y = ..density..), 
                 color = "black", 
                 binwidth = 5, 
                 alpha = 0.5)+
  geom_density(alpha = 0.3)+
  facet_grid(sinif ~.)

#Numerik test


apply(iki_ornek_veri, 2, shapiro.test)


shapiro.test(AB[AB$sinif == "B",]$degerler)



## Varyans homojenliginin incelenmesi

library(car)

leveneTest(AB$degerler ~ AB$sinif, center = mean)


## Hipotez Testi


t.test(AB$degerler ~ AB$sinif, var.equal = TRUE)


## Yorum : iki grup arasinda anlamli bir farklilik vardir.
## B grubu daha iyidir ve yapilan modelleme calismasinda farklilik vardir.


## Alternatif fonksiyon


infer_ts_ind_ttest(data = AB, x = sinif, y = degerler)



## Nonparametrik Mann-whitney U

wilcox.test(iki_ornek_veri$A, iki_ornek_veri$B)


















































