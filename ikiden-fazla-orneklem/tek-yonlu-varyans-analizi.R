
#H0: M1 = M2 = M3 (grup ortalamalari arasinda ist anl. farklilik yoktur)
#H1: Fark vardir.



A <- c(28,33,30,29,28,29,27,31,30,32,28,33,25,29,27,31,31,30,31,34,30,32,31,34,28,32,31,28,33,29)

B <- c(31,32,30,30,33,32,34,27,36,30,31,30,38,29,30,34,34,31,35,35,33,30,28,29,26,37,31,28,34,33)

C <- c(40,33,38,41,42,43,38,35,39,39,36,34,35,40,38,36,39,36,33,35,38,35,40,40,39,38,38,43,40,42)


A <- data.frame(SURE = A, GRUP = "A")

B <- data.frame(SURE = B, GRUP = "B")

C <- data.frame(SURE = C, GRUP = "C")


veri <- rbind(A,B)

veri <- rbind(veri, C)


veri %>% group_by(GRUP) %>%
  summarise(mean(SURE), median(SURE), sd(SURE))


ggplot(veri, aes(GRUP, SURE, fill = GRUP)) +
  geom_boxplot()



###  Normal Dagilim

shapiro.test(veri[veri$GRUP == "A",]$SURE)

shapiro.test(veri[veri$GRUP == "B",]$SURE)

shapiro.test(veri[veri$GRUP == "C",]$SURE)


### Varyans Homojenligi Testi


bartlett.test(SURE ~ GRUP, data = veri)
leveneTest(SURE ~ GRUP, data = veri)



## Hipotez Testi


aov(SURE ~ GRUP, data = veri)

summary(aov(SURE ~ GRUP, data = veri))


##  Ikili Karsilastirma


TukeyHSD(aov(SURE ~ GRUP, data = veri))



## Alternatif Fonksiyon

infer_oneway_anova(veri, SURE, GRUP)



## Nonparametrik Karsilik: Kruskal-Wallis H


kruskal.test(SURE ~ GRUP, veri)










