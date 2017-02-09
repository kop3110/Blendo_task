library(party)
library(caret)


# Create the input data frame.
dataset<- read.csv("YES_OR_NO.csv",head=TRUE)
validation_index <- createDataPartition(dataset$action_id, p=0.70, list=FALSE)
validation <- dataset[-validation_index,]
dataset <- dataset[validation_index,]
metric <- "Accuracy"
control <- trainControl(method="cv", number=10)

# Give the chart file a name.

# Create the tree.
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

# Save the file.