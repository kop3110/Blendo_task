png(filename="subscription_Status.png",width=1800,height=950,res=300)
total<-read.csv("status subscription.csv",head=TRUE)
data1<-(total$count)
data2<-(total$status)
percent=round(100*data1/sum(data1),1)
pielabels<- paste(total$status,",",percent, "%", sep="")
pie(100*data1/sum(data1),labels=pielabels,main='Subscription status',col=rainbow(length(data2)),cex=0.8)
dev.off()



