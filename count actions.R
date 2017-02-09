png(filename="count actions.png",width=1800,height=950,res=300)
total<-read.csv("open vs click.csv",head=TRUE)
pie(total,labels=pielabels,main='Actions (Open,Click,Bounce)',col=rainbow(length(data2)),cex=1)

dev.off()


