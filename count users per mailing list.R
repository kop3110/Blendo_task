png(filename="count_users_per_list_mailing.png",width=1800,height=950,res=300)
new_total<-read.csv("count users per list.csv",head=TRUE)
new_total1<-read.csv("count users per list transposed.csv",head=TRUE)
barlabel<- paste(new_total1$users)
bp=barplot(as.matrix(new_total),main="Users per mailing list ",col=c("blue"),cex.names=0.8,cex.axis = 0.8,beside=TRUE,xlab="Mailing List",ylab="Users",cex.lab=0.8,cex.main=0.8, ylim=c(0, 1400))
text(bp, new_total1$users+50, labels=barlabel,cex=0.8)
dev.off()

