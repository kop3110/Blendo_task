total2<-read.csv("open vs click.csv",head=TRUE)
bp=barplot(total2,main="Users per mailing list",names.arg=total2$list_id,col=rainbow(length(total2$users_per_list)))

