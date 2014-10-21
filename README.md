========================================================

Getting and Cleaning Data course project

README file

Christopher Claassen
chrisclaassen.com

========================================================


Data Source:
------------

This project extracts and recodes data from the "Human Activity Recognition Using Smartphones Dataset". This dataset contains various measurements related to movement that were obtained using gyrometer and accelerometer signals from smartphones. Multiple measures were taken from 30 subjects who each performed 6 actions. The original dataset was downloaded from: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Further details are available at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


Procedure:
----------

The downloaded file is unzipped, and the training (X_train.txt, Y_train.txt, subject_train.txt) and test datasets (X_test.txt, Y_test.txt, subject_test.txt) are combined. 

The original data contained 17 measures of each of 33 different signals from subjects' smartphones, for 561 total features per subject. Only 2 of these measures are extracted - the mean and standard deviation of each signal - for a total of 66 features per subject. 

The 'project_data.txt' dataset provided in this repo reports the average value for each of these 66 variables, across each of the 30 subjects and 6 actions in the original dataset.

The variable names include the following information:

- 'time' or 'freq': time or frequency measure.

- 'body' or 'gravity': source of force.

- 'accel' or 'gyrom': data from accelerometer or gyrometer.

- 'mean' or 'stdev': mean or standard deviation measure.

- 'jerk': if Jerk signals were obtained.

- 'dimx', 'dimy' or 'dimz': movement in X, Y or Z dimension.

See the source for further details.


This repo includes the following files:
---------------------------------------

- 'README.md'

- 'run_analysis.R': R code to replicate the extraction and recoding of the 'project_data.txt' file.

- 'project_data.txt': dataset of averages of select variables from the Human Activity Recognition Using Smartphones Dataset, by subject and action

- 'project_codebook.txt': codebook describing each variable in the 'project_data.txt' dataset


Notes:
------
The authors of the Human Activity Recognition Using Smartphones Dataset request that use of this dataset in publications must be acknowledged by referencing the following publication:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


