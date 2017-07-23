> Introduction
 
 The script 'run_analysis.R' performs the 5 steps described in the course project's definition.
 
 ^ First, all the matching data is merged using the 'rbind()' function. By matching, we address those files having the same number of columns and referring to the same entries.
 ^ Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from 'features.txt'.
 ^ As activity data is addressed with values 1:6, we take the activity names and IDs from 'activity_labels.txt' and they are substituted in the dataset.
 ^ On the whole dataset, those columns with weird column names are corrected.
 ^ Finally, we make a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called 'Tidy.txt', and uploaded to this repository.
 
 > Variables
 
 ^ 'TrainX', 'TrainY', 'TestX', 'TestY', 'SubjectTrain' and 'SubjectTest' contain the data from the downloaded files.
 ^ 'X', 'Y' and 'Subject' merge the previous datasets to further analysis.
 ^ 'Features' contains the correct names for the 'X' dataset, which are applied to the column names stored in 'index', a numeric vector used to extract the desired data.
 ^ A similar approach is taken with activity names through the 'Activities' variable.
 ^ 'cleanseddata' merges 'X', 'Y' and 'Subject' in a big dataset.
 ^ Finally, 'tidydata' contains the relevant averages which will be later stored in a `.txt` file. 'data.table' from the data.table package is used to stratify, write and ease the development.