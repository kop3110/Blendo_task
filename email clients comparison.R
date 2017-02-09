png(filename="email_clients_comparison.png",width=1800,height=950,res=300)
total<-read.csv("email clients.csv",head=TRUE)
total1<-read.csv("email client non trans.csv",head=TRUE)
data1<-total1$email_client
data2<-total1$count
barlabel<- paste(data2)
bp=barplot(as.matrix(total),main="Email Clients Comparison",col=rainbow(length(data1)),las=2,cex.names=0.6,cex.axis = 0.8,beside=TRUE,ylab="Visits",cex.lab=0.8,cex.main=0.8,ylim=c(0,800))
legend("topright",legend=data1,fill=rainbow(length(data1)),ncol=3,bty ="n",cex=0.4)
text(bp, data2+30, labels=barlabel,cex=0.4)
dev.off()



