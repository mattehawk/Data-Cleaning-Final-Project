## Getting and Cleaning Data Project 

## Code Book

# This codebook is a description of the variables, data, and transformation completed to complete the project and produce the desired data sets.

    
# Link to database where the raw data was obtained:
# ...http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
# Additional information on the project at the UCI website
# ...https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
    
# ....* The run_analysis.R script performs the following steps to clean the data:
        
# ....* Read X_train.txt, y_train.txt and subject_train.txt from the "./data/train" folder and store them in self named tables within R.
        
# ....* Read X_test.txt, y_test.txt and subject_test.txt from the "./data/test" folder and store them in self named tables within R.
        
# ....* Bind testing and training data to generate a single data frame: Telemetry; bind labels to generate a 10299x1 data frame, Activity2.
        
# ....* Read the features.txt file from the "/data" folder and store the data in a variable called features. 

# ....* Here we separte the mean and standard devlation data only with Def_Meta
       
# ....* Clean the column names of the subset. We remove the "()" and "-" symbols in the names, make the first letter of "mean" and "std" a capital letter "M" and "S".
       
# ....* Read the activity_labels.txt file from the "./data"" folder and store the data in a variable called activity.
      
# ....* Combine the subjectID,Telemetry, and Activity2 to achieve Alldata_cleaned.txt. Properly name the first two columns, "SubjectID" and "Activity_Label".
       
# ....* Write the cleanedData out to "TidyData.txt" file in current working directory.
       
# ....* Write a second set of data called "MeanData.txt"in current working directory.

