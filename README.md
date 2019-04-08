# Peer-graded Assignment: Getting and Cleaning Data Course Project
One of the most exciting areas in all of data science right now is wearable computing.
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.

The purpose of this project is collect, work with, and clean data collected from the accelerometers from the Samsung Galaxy S smartphone.

The repo contains this files:

- README.md: provides an overview of the data set and how it was created

- CodeBook.md: describes the contents of the data set: data, contents, variables and transformation
necessary for the project.

- run_analysis.R: is the R script written for the project

- tidy_data.txt: contains the result dataset

# Steps and results:
The R script run_analysis.R downloads datasets and transforms them to produce the final data set.
The code is structured in 5 steps:

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement.
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names.
- From the data set in step 4, creates a second, independent tidy data set with the average of each variable
for each activity and each subject.

The result is tidy_data.txt
