run_analysis<-function(){
    
    # Downlaod and save the files in preparation for organizing, cleaning and analysis
    ## Set the working directory
    setwd("C:/Users/Matthew/Desktop/Coursera/Data_Cleaning_Final")
    
    ## Check if our folder exits, and if not create it
    if(!file.exists("Data_Cleaning_Final")){dir.create("Data_Cleaning_Final")}
    ## Define the location of the file to be downloaded
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    ## Doanload the file and store it in our working directory and specific folder
    download.file(fileUrl, destfile = "./Data_Cleaning_Final/harus.zip")
    ## Unzip the file and store it in the same working directory and specific folder
    unzip(zipfile="./Data_Cleaning_Final/harus.zip",exdir="./Data_Cleaning_Final")
    
    
    
    
    #Loading the files into R
    
    X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
    
    y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
    
    subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
    
    X_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
    
    y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
    
    subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
    
    features<-read.table("./UCI HAR Dataset/features.txt")
    
    activity<-read.table("./UCI HAR Dataset/activity_labels.txt")
    
    #take a first look at the data sets to verify they exist (success of read.table)
    
    head(X_test)
    head(y_test)
    head(subject_test)
    head(X_train)
    head(y_train)
    head(subject_train)
    head(features)
    head(activity)
    
    ##Bind corresponding sets together per the project summary on the readme file
    ##which came along with the download, that describes the data associations
    
    # Bind paired data sets
    Telemetry<-rbind(X_test,X_train)
    ActivityID<-rbind(y_test,y_train)
    subjectID<-rbind(subject_test,subject_train)
    
    # We only want data ssoicated with standard deviation and mean
    Def_Meta<-grep("mean\\(\\)|std\\(\\)",features[,2])
    
    # here we tabalize our testin and trainin data with the features dta pertinent to mean and sd
    Telemetry <- Telemetry[, Def_Meta]
    names(Telemetry)
    
    #just cleinaing it up a bit here with the next few lines
    names(Telemetry) <- gsub("\\(\\)", "", features[Def_Meta, 2])
    names(Telemetry) <- gsub("mean", "Mean", names(Telemetry)) 
    names(Telemetry) <- gsub("std", "Std", names(Telemetry)) 
    names(Telemetry) <- gsub("-", "", names(Telemetry))  
    
    
    # verify success in binding and take a first look at the data sets with 
    # summary function
    summary(Telemetry)
    summary(ActivityID)
    summary(subjectID)
    head(Features_inc)
    
    #Giving the column subjectID a header name
    
    colnames(subjectID)<-"SubjectID"
    
    ##load libraries to be used outside fo standard
    # will be used for merging data
    library(plyr)
    # will be used for pushing merged data to table
    library(data.table)
    
    #Merging Activity labels with Y
    Activity<-join(ActivityID,activity)
    Activity2<-Activity[,2]
    Activity2<-data.frame(Activity2)
    colnames(Activity2)<-"Activity_Label"
    
    #Complete data set made - Tidy Data Set
    Alldata<-cbind(subjectID,Telemetry,Activity2)
    write.table(Alldata,"Alldata_cleaned.txt")
    
    #Create Tidy Data Set
    TidyData<-data.table(Alldata)
    
    #Crate second Tidy Data Set with Means
    MeanData<-TidyData[,lapply(.SD,mean), by=c("SubjectID","Activity_Label")]
}

write.table(TidyData, "c:/users/matthew/desktop/coursera/Data_Cleaning_Final/TidyData.txt", sep="\t") 
write.table(MeanData, "c:/users/matthew/desktop/coursera/Data_Cleaning_Final/MeanData.txt", sep="\t")
