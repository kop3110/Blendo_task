total<-read.csv("status subscription.csv",head=TRUE)
data1<-(total$count)
data2<-(total$status)
percent=round(100*data1/sum(data1),1)
pielabels<- paste(total$status,",",percent, "%", sep="")
pie(100*data1/sum(data1),labels=pielabels,main='Subscription status',col=col1)






