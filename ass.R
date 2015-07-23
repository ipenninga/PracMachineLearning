# Assignment for MAchine Learning
# Velloso, E.; Bulling, A.; Gellersen, H.; Ugulino, W.; Fuks, H. Qualitative Activity Recognition of Weight Lifting Exercises. Proceedings of 4th International Conference in Cooperation with SIGCHI (Augmented Human '13) . Stuttgart, Germany: ACM SIGCHI, 2013.

# Read more: http://groupware.les.inf.puc-rio.br/har#ixzz3gbvAGgXX

training<-read.csv("pml-training.csv")

# head(training)
# summary(training)

##### Feature extraction

#check for NA's and impute if necessary
#dim(training)
a<-is.na(training)
#sum(a) ; # many NA's !
# many columns/variables have 19216 NA's , I expect these are the same cases. 
# is it wise to impute?
table(training$classe,training$user_name)
table(is.na(training$stddev_yaw_forearm),training$classe)
# No nearly all cases have NA 19216 out of 19622, and it is not a classifier for A:E 
# Option remove the variables, since they are only filled for new window Yes, but these are not in the test set.

b<-colSums(a)


library(caret); library(kernlab);
trainingCleanNA<-training[,b<1]
nsv<-nearZeroVar(trainingCleanNA,saveMetrics=TRUE)
trainingCleanNAnzv<-trainingCleanNA[,nsv$nzv==FALSE]

#####
