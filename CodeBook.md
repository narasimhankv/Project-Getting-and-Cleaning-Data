# Introduction to CodeBook.md

Describes the variables, the data, and any transformations or work performed to clean up the data.

# Datasource

The below link is the datasource for the project

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

# Files in datasource and description

* 'README.txt'

* 'features_info.txt': Shows information about the variables used on the feature vector.

* 'features.txt': List of all features.

* 'activity_labels.txt': Links the class labels with their activity name.

* 'train/X_train.txt': Training set.

* 'train/y_train.txt': Training labels.

* 'test/X_test.txt': Test set.

* 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

# Transformation and summarization

* subject_test,X_test,y_test,subject_train,X_train,y_train,activity_labels are combined to create dataset combine
* features.txt is used to name the coloumns in X_test and X_train
* subject_train and subject_test are labelled as subject_id
* activity_labels dataset is named as activity_id and activity_name and is merged with combine using activity_id as primary key
* The combined dataset is filtered for only for variabled representing standard deviation or means (std or mean) in the combine dataset
* Combing dataset is summarized using subject_id and activity_name as primary keys



