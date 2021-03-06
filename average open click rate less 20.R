png(filename="average_open_rate_click_20.png",width=1800,height=950,res=300)
new_total<-read.csv("location country code statistics open click less 0.2.csv",head=TRUE)
new_total1<-read.csv("location country code statistics open click.csv",head=TRUE)
data_1<-(new_total1$stats_avg_open_rate)
data_2<-(new_total1$stats_avg_click_rate)
data_3<-(new_total1$location_country_code)
bp=barplot(as.matrix(new_total),main="Location with open and click rate <0.2")
text(bp, data_1[data_1<0.2]-0.01, data_1[(data_1<0.2)],cex=0.6)
text(bp, data_2[data_1<0.2]+0.01, data_2[(data_1<0.2)],cex=0.6)
dev.off()