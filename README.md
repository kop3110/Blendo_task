# Blendo_task
## Location with average click and open rate
### SQL
```sql
SELECT location_country_code,format(avg(stats_avg_click_rate),3)as stats_avg_click_rate,format(avg(stats_avg_open_rate),3)as stats_avg_opentable3_rate FROM blend.table3 group by location_country_code;
```
### R-Diagram open rate <20
```r
png(filename="average_open_rate_click_le_20.png",width=1800,height=950,res=300)
new_total<-read.csv("location country code statistics open click less 0.2.csv",head=TRUE)
new_total1<-read.csv("location country code statistics open click.csv",head=TRUE)
data_1<-(new_total1$stats_avg_open_rate)
data_2<-(new_total1$stats_avg_click_rate)
data_3<-(new_total1$location_country_code)
bp=barplot(as.matrix(new_total),main="Location with open and click rate (Open rate <20%) ",col=c("blue","yellow"),las=2,cex.names=0.6,cex.axis = 0.6,beside=TRUE,xlab="Country Code",ylab="Open VS Click Rate",cex.lab=0.6,cex.main=0.6, ylim=c(0, 0.4))
legend("top",legend=c("open rate","click rate"),fill=c("blue","yellow"),ncol=3,bty ="n",cex=0.6)
dev.off()
```
### R-Diagram open rate between 20 and 40
```r
png(filename="average_open_rate_click_BE20_40.png",width=1800,height=950,res=300)
new_total<-read.csv("location country code statistics open click between 0.2 0.4.csv",head=TRUE)
new_total1<-read.csv("location country code statistics open click.csv",head=TRUE)
data_1<-(new_total1$stats_avg_open_rate)
data_2<-(new_total1$stats_avg_click_rate)
data_3<-(new_total1$location_country_code)
bp=barplot(as.matrix(new_total),las=2,main="Location with open and click rate (Open rate 20-40%) ",col=c("blue","yellow"),cex.names=0.6,cex.axis = 0.6,beside=TRUE,xlab="Country Code",ylab="Open VS Click Rate",cex.lab=0.6,cex.main=0.6, ylim=c(0, 0.6))
legend("top",legend=c("open rate","click rate"),fill=c("blue","yellow"),ncol=3,bty ="n",cex=0.6)
dev.off()
```
### R-Diagram open rate greater 40
```r
png(filename="average_open_rate_click_GR40.png",width=1800,height=950,res=300)
new_total<-read.csv("location country code statistics open click gr0.4.csv",head=TRUE)
new_total1<-read.csv("location country code statistics open click.csv",head=TRUE)
data_1<-(new_total1$stats_avg_open_rate)
data_2<-(new_total1$stats_avg_click_rate)
data_3<-(new_total1$location_country_code)
bp=barplot(as.matrix(new_total),las=2,horiz=TRUE,main="Location with open and click rate (Open rate >40%) ",col=c("orange","green"),cex.names=0.6,cex.axis = 0.6,beside=TRUE,xlab="Country Code",ylab="Open VS Click Rate",cex.lab=0.6,cex.main=0.6, ylim=c(0, 1))
legend("top",legend=c("open rate","click rate"),fill=c("orange","green"),ncol=3,bty ="n",cex=0.6)
dev.off()
```
### Open/Bounce/Click Table
```SQL
SELECT table1.action,count(table1.action) as actions_number
FROM blend.table1
GROUP BY table1.action;
```
### R diagram Actions
```r
png(filename="count actions.png",width=1800,height=950,res=300)
total<-read.csv("open vs click.csv",head=TRUE)
pie(total,labels=pielabels,main='Actions (Open,Click,Bounce)',col=rainbow(length(data2)),cex=1)
dev.off()
```

### Status Subscription
```SQL
SELECT status,count(status) as count FROM blend.table3 group by status;
```
### R diagram
```r
png(filename="subscription_Status.png",width=1800,height=950,res=300)
total<-read.csv("status subscription.csv",head=TRUE)
data1<-(total$count)
data2<-(total$status)
percent=round(100*data1/sum(data1),1)
pielabels<- paste(total$status,",",percent, "%", sep="")
pie(100*data1/sum(data1),labels=pielabels,main='Subscription status',col=rainbow(length(data2)),cex=0.8)
dev.off()
```


### Soft VS Hard Bounce
```SQL
SELECT table1.type,count(table1.type) as count_types
FROM blend.table1
where table1.type="soft" or table1.type="hard"
group by table1.type;
```
### R diagram
```r
png(filename="soft vs hard bounce.png",width=1800,height=950,res=300)
new_total<-read.csv("count soft hard bounce.csv",head=TRUE)
bp=barplot(as.matrix(new_total),main="Soft VS Hard Bounce",col=c("blue","orange"),beside=TRUE,cex.names=0.4,cex.axis = 0.4,xlab="Type of Bounce",ylab="Number",cex.lab=0.4,cex.main=0.6, ylim=c(0, 200))
legend("topright",legend=c("Hard Bounce","Soft Bounce"),fill=c("blue","orange"),ncol=3,bty ="n",cex=0.4)
dev.off()
```
### Users per mailing List
```SQL

SELECT list_id,count(distinct id) as users_per_list
 FROM blend.table3
 group by list_id;
```
### R diagram
```r
png(filename="count_users_per_list_mailing.png",width=1800,height=950,res=300)
new_total<-read.csv("count users per list.csv",head=TRUE)
new_total1<-read.csv("count users per list transposed.csv",head=TRUE)
barlabel<- paste(new_total1$users)
bp=barplot(as.matrix(new_total),main="Users per mailing list ",col=c("blue"),cex.names=0.8,cex.axis = 0.8,beside=TRUE,xlab="Mailing List",ylab="Users",cex.lab=0.8,cex.main=0.8, ylim=c(0, 1400))
text(bp, new_total1$users+50, labels=barlabel,cex=0.8)
dev.off()
```


### Email Client Comparison

```SQL
SELECT email_client,count(email_client)  FROM blend.table3 GROUP BY email_client;
```

### R Diagram
```r
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
```



### Click-Open with Delivery hours
```SQL
SELECT hour(timestamp) as hours,count(hour(timestamp)) as count_of_open_per_hour FROM blend.table1 where action="click" group by hour(timestamp);
SELECT hour(timestamp) as hours,count(hour(timestamp)) as count_of_open_per_hour FROM blend.table1 where action="open" group by hour(timestamp);
```
### R diagram
```r
png(filename="open vs click per hour.png",width=1800,height=950,res=300)
new_total<-read.csv("open vs click delivery hours transposed.csv",head=TRUE)
new_total1<-read.csv("click delivery hours.csv",head=TRUE)
new_total2<-read.csv("open delivery hours.csv",head=TRUE)
percent1=round(100*new_total1$count_of_open_per_hour/sum(new_total1$count_of_open_per_hour),1)
percent2=round(100*new_total2$count_of_open_per_hour/sum(new_total2$count_of_open_per_hour),1)
barlabel<- paste(percent2)
bp=barplot(as.matrix(new_total),main="Open VS Clicks per hour",col=c("blue","orange"),cex.names=0.4,cex.axis = 0.4,xlab="Hour",ylab="Deliveries",cex.lab=0.4,cex.main=0.6, ylim=c(0, 1000))
legend("topleft",legend=c("Open per hour","Clicks per hour"),fill=c("blue","orange"),ncol=3,bty ="n",cex=0.4)
dev.off()
```

### Multi VS Single Platform Users
```SQL
SELECT format(avg(blend.table3.stats_avg_click_rate),3)as avg_click_rate_multi_platform,format(avg(blend.table3.stats_avg_open_rate),3)as stats_avg_open_rate_multi_platform 
FROM blend.table3,blend.multi_platform_users 
where blend.table3.id=blend.multi_platform_users.id;
```
```SQL
SELECT format(avg(blend.table3.stats_avg_click_rate),3)as avg_click_rate_single_platform,format(avg(blend.table3.stats_avg_open_rate),3)as stats_avg_open_rate_single_platform 
FROM blend.table3,blend.single_platform_users 
where blend.table3.id=blend.single_platform_users.id;
```
### R diagram
```r
png(filename="single vs multi platform.png",width=1800,height=950,res=300)
new_total<-read.csv("single vs multi platform stats click and open.csv",head=TRUE)
bp=barplot(as.matrix(new_total),main="Single VS Multi platform statistics",col=c("blue","orange"),beside=TRUE,cex.names=0.6,cex.axis = 0.6,xlab="Type of User",ylab="Rates",cex.lab=0.6,cex.main=0.6, ylim=c(0, 0.6))
legend("topleft",legend=c("Single Platform User","Multi Platform User"),fill=c("blue","orange"),ncol=3,bty ="n",cex=0.6)
dev.off()
```


### Campaign Statistics

```SQL
SELECT blend.clickpercampaignid.campaign_id,blend.clickpercampaignid.click,blend.openpercampaign_id.open
from blend.clickpercampaignid,blend.openpercampaign_id
where blend.clickpercampaignid.campaign_id=blend.openpercampaign_id.campaign_id
group by blend.clickpercampaignid.campaign_id
order by  open desc;
```
### Predictive Model
```SQL
SELECT blend.`table1 with counter`.row_number,blend.`table1 with counter`.email_id,hour(blend.`table1 with counter`.timestamp) as delivery_hour,
case 
when(blend.`table1 with counter`.action="open") then 0
when(blend.`table1 with counter`.action="bounce") then 0 
else 1
end
as action_id
from blend.`table1 with counter`;
```
```SQL
SELECT id,location_country_code,
case
when (count(email_client)>1) then "multi"
else "single"
end
as single_or_multi
from blend.table3
group by id;
```
```SQL
select blend.`email id location country code single or multi platform`.id,blend.`email id location country code single or multi platform`.location_country_code,blend.`email id location country code single or multi platform`.single_or_multi,blend.`email_id with action_id timestamp`.action_id,blend.`email_id with action_id timestamp`.delivery_hour
from blend.`email id location country code single or multi platform`,blend.`email_id with action_id timestamp`
where blend.`email id location country code single or multi platform`.id=blend.`email_id with action_id timestamp`.email_id;
```

# Building Predicting Model
```r
library(party)
library(caret)
dataset<- read.csv("YES_OR_NO.csv",head=TRUE)
validation_index <- createDataPartition(dataset$action_id, p=0.70, list=FALSE)
validation <- dataset[-validation_index,]
dataset <- dataset[validation_index,]
metric <- "Accuracy"
control <- trainControl(method="cv", number=10)

set.seed(7)
fit.cart <- train(action_id~., data=dataset, method="rpart", metric=metric, trControl=control)
set.seed(7)
fit.rf <- train(action_id~., data=dataset, method="rf", metric=metric, trControl=control)
test_tree<- rpart(action_id~.,data=dataset,cp=.02,method="class")
rpart.plot(test_tree)
results <- resamples(list(cart=fit.cart, rf=fit.rf))
summary(results)
dotplot(results)
predictions <- predict(fit.cart, newdata=validation)
confusionMatrix(predictions, validation$action_id)
```
