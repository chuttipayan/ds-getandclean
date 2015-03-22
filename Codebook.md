The directory UCI HAR Dataset contains the train and test data sets under the train and test sub directories 

activity_labels.txt contains the activities .This is read into activity_labels variable

x_test.txt/train.txt contains the data for the features described in features.txt file

y_test.txt/y_train.txt contains the activity for which the measurements were measured.

subject_train/subject_test.txt contains the subject's for which the measurements were measured

The levels are calculated .

The script reads the above files and does the cbind to add the subject and the activity columns to the data got from x_test.txt.

THe column names are given as subject and activity and the rows got from features.txt.

Data frame is filtered  with column names having mean and std.

The script  uses the reshape2 and plyr library to aggregate / prepare the tidy data set

The tidy data set contains the following columns 
1- activity 
2- suject 
3- mean



