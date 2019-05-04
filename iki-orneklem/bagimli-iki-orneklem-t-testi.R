

## H0 : M0 = MS
## H1 : M0 != MS

oncesi <- c(123,119,119,116,123,123,121,120,117,118,121,121,123,119,
            121,118,124,121,125,115,115,119,118,121,117,117,120,120,
            121,117,118,117,123,118,124,121,115,118,125,115)

sonrasi <- c(118,127,122,132,129,123,129,132,128,130,128,138,140,130,
             134,134,124,140,134,129,129,138,134,124,122,126,133,127,
             130,130,130,132,117,130,125,129,133,120,127,123)


A <- data.frame(ortalam_satis = oncesi, ONCE_SONRA = "ONCE")
B <- data.frame(ortalam_satis = sonrasi, ONCE_SONRA = "SONRA")

once_sonra <- rbind(A,B)

library(funModeling)

profiling_num(once_sonra)


once_sonra %>%
  group_by(ONCE_SONRA) %>%
  summarise(mean(ortalam_satis), sd(ortalam_satis), var(ortalam_satis))

ggplot(once_sonra, aes(ONCE_SONRA, ortalam_satis))+
  geom_boxplot()


apply(data.frame(oncesi,sonrasi), 2, shapiro.test)



t.test(once_sonra$ortalam_satis ~ once_sonra$ONCE_SONRA, paired = TRUE)


## Alternatif fonksiyon

library(inferr)


df <- data.frame(oncesi,sonrasi)
infer_ts_paired_ttest(df, x = oncesi, y = sonrasi)














