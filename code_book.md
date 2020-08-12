## Intro
The following are the variables descriptions and processing varaibles

## Variables Description
Data read from project data files. For description of each data files, refer to README in the project folder.

feature_name - features.txt file

activity_label - activity_labels.txt file

subj_trn - subject_train.txt

x_trn - train/X_train.txt

y_trn -train/Y_train.txt

subj_tst - subject_test.txt file

x_tst - X_test.txt

y_tst - Y_test.txt

subject - combine subj_trn and subj_tst

activity - combine y_tst and y_train

features - combine x_tst and x_train

complete_data - Merging all data


### Processing variables
columns_mean_std -Extract the column indices that have either mean or std in them.

arequiredColumns - add activity and subject columns to the list complete_data

extracted_data -We create extractedData with the selected columns in requiredColumns. It is updated to get the acitivity names.

tidyData - aggregrate the data into convert into txt

