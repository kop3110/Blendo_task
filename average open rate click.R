png(filename="average_open_rate_20.png",width=1800,height=950,res=300)
new_total<-read.csv("location country code statistics open click.csv",head=TRUE)
data_1<-(new_total$stats_avg_open_rate)
data_2<-(new_total$stats_avg_click_rate)
data_3<-(new_total$location_country_code)
bp=barplot(data_1[data_1<0.2],main="Average open rate (<20%)",names.arg=data_3[data_1<0.2])
text(bp, data_1[data_1<0.2]-0.01, data_1[data_1<0.2])
dev.off()



