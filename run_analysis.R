output <- function() {
    testDat  <- read.table("./UCI HAR Dataset/test/X_test.txt")
    subjectTest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
    testCat <- read.table("./UCI HAR Dataset/test/y_test.txt")
    trainDat <- read.table("./UCI HAR Dataset/train/X_train.txt")
    subjectTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
    trainCat <- read.table("./UCI HAR Dataset/train/y_train.txt")
    featureDat <- read.table("/UCI HAR Dataset./features.txt")
    activityLabel <- read.table("/UCI HAR Dataset./activity_labels.txt")
    names(testDat) <- featureDat$V2
    names(trainDat) <- featureDat$V2 
    tmpCat = factor(activityLabel$V2)
    trainDat <- cbind(trainDat, activities = tmpCat[trainCat$V1])
    testDat  <- cbind(testDat,  activities = tmpCat[ testCat$V1])
    trainDat <- cbind(trainDat, subject = subjectTrain$V1)
    testDat  <- cbind(testDat,  subject =  subjectTest$V1)
    mergedDat <- rbind(trainDat, testDat)
    retVal <- mergedDat[,grep("mean|std|activities|subject", names(mergedDat))]
    names(retVal) <- gsub("-","",names(retVal),fixed=TRUE)
    names(retVal) <- sub("()","",names(retVal),fixed=TRUE)
    data_summary <- retVal %>% group_by(activities,subject) %>% summarise_each(funs(mean), tBodyAccmeanX:fBodyBodyGyroJerkMagstd)
    write.table(data_summary, "output.txt", row.name=F, append=F)
}
    
    