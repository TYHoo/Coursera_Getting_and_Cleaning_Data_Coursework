# Code book for Coursera Getting and Cleaning Data course project

See `README.md` for background information of the data set and overview of the project.

See `tidy_data.txt` for the final data set produced.

## Data

The `tidy_data.txt` data file is a text file, containing space-separated values.

The first row contains the names of the variables, described in the Variables section below, 
and the following rows contain the values of these variables. 

## Variables

Each row contains, for a given subject and activity, 79 averaged signal measurements.

### Identifiers

- `subject`

	Subject identifier, integer, ranges from 1 to 30.

- `activity`

	Activity identifier, with 6 possible values: 
	- `WALKING`: subject was walking
	- `WALKING_UPSTAIRS`: subject was walking upstairs
	- `WALKING_DOWNSTAIRS`: subject was walking downstairs
	- `SITTING`: subject was sitting
	- `STANDING`: subject was standing
	- `LAYING`: subject was laying

### Average of measurements

- `Accelerometer` refers to acceleration measurements

- `Gyroscope` refers to gyroscope measurements

- `Magnitude` refers to magnitudes of three-dimensional signals

The measurements are classified in two domains:

- `timeDomain` refers to the time-domain signals

- `frequencyDomain` refers to the frequency-domain signals


## Transformations

The following transformation is applied to the source data (by running R script `run_analysis.R`):

1. The training and test sets are merged into one data set.
1. Measurements on the mean and standard deviation are extracted for each measurement.
1. The activity identifiers (originally coded as integers between 1 and 6) were replaced with descriptive activity names.
1. The variable names were replaced with descriptive variable names.
1. From the data set in step 4, the final data set was created with the average of each variable for each activity and each subject.
