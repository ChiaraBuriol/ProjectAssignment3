---
title: "Peer-graded Assignment: Getting and Cleaning Data Course Project"
author: "ChiaraMariaBuriol"
date: "06 aprile 2019"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Authors of input Data

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

Smartlab - Non Linear Complex Systems Laboratory

DITEN - Università degli Studi di Genova.

Via Opera Pia 11A, I-16145, Genoa, Italy.

activityrecognition@smartlab.ws

www.smartlab.ws


## Sources: 

Human Activity Recognition Using Smartphones Dataset Version 1.0 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 

Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 

Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 

The experiments have been video-recorded to label the data manually. 

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 

The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 

From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

See 'features_info.txt' for more details. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 

- Triaxial Angular velocity from the gyroscope. 

- A 561-feature vector with time and frequency domain variables. 

- Its activity label. 


- An identifier of the subject who carried out the experiment. 


The input dataset includes the following files:

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.
                  Features are normalized and bounded within [-1,1]
                  Each feature vector is a row on the text file.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 



## Transformations
The following transformations were applied to the source data through the run_analysis.R script:

1. The training and test data where merged to create a unique dataset

2. Only the columns containing the mean and standard deviation were extracted (in particular column's labels containing "mean" and "std" string)

3. The activity identifiers (originally coded as integers between 1 and 6) were replaced with descriptive activity names

4. The variable labels (v1, v2, etc...) were replaced with descriptive variable names

5. The final dataset tidy_data was created with the average of each variable for each activity and each subject.

6. The final dataset was saved in a txt file (tidy_data.txt)


## Output Data
The collection of the source data and the transformations were implemented by the run_analysis.R R script

The tidy_data.txt data file is the result file coming from the run_analysis.R R script.

The tidy_data.txt has 180 observations and 82 variables.

The first row contains the names of the variables and the following rows contain the values of these variables.

Each row contains, for a given subject and activity, 79 averaged signal measurements. 

The variables in tidy_data dataset are: 

- Subject_id: is the subject identifier, integer, ranges from 1 to 30. 

- Activity_type: Activity identifier, string with 6 possible values:
 		
 		- LAYING: subject was laying
		
		- SITTING: subject was sitting
		
		- STANDING: subject was standing
		
		- WALKING: subject was walking
		
		- WALKING_DOWNSTAIRS: subject was walking downstairs
		
		- WALKING_UPSTAIRS: subject was walking upstairs
- Activity_id: Activity identifier, string with 6 possible values, integer ranges from 1 to 6 associated to activity_type

- 79 averaged signal measurements. These variables are selected from the input variables described into the feature_info.txt. They represent the only columns containing the mean and standard deviation measurements. 
