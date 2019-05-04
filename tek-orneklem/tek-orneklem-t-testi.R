

##Hipotezler 
# H0 : M >= 170
# HS : M < 170


## Veri Seti

olcumler <- c(17, 160, 234, 149, 145, 107, 197, 75, 201, 225, 211, 119,
              157, 145, 127, 244, 163, 114, 145, 65, 112, 185, 202, 146,
              203, 224, 203, 114, 188, 156, 187, 154, 177, 95, 165, 50, 110,
              216, 138, 151, 166, 135, 155, 84, 251, 173, 131, 207, 121, 120)


summary(olcumler)



##Varsayimlar

#Histogram

hist(olcumler)

#Q-Q plot (or quantile-quantile plot)

library(ggpubr)

ggqqplot(olcumler)


#Shapiro-Wilk Testi (Normallik Testi)

shapiro.test(olcumler)

### P-value 0,5'den buyuk oldugu icin bu dagilim normaldir,
### Teorik dagilim ile orneklem dagilimi arasinde fark yoktur.
### Bu yuzden hipotezimizi test edebiliriz.



## tek orneklem t testi

t.test(olcumler, mu = 170, 
       alternative = "less", 
       conf.level = 0.95)

## P-value 0.017 oldugu icin H0 red edilir.
## Yorum : Kullanicilerin web sitesinde gecirdigi ortalama sure 170sn'den dusuktur.

## Dagilim parametrik olmasaydý welch t testi kullanacaktik.



### Alternatif fonksiyon


library(inferr)

df <- data.frame(olcumler)
infer_os_t_test(df, olcumler, 
                mu = 170,
                type = all)


























