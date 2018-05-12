# Coursera_Getting_and_Cleaning_Data_Coursework

This is the project for the Coursera course, Getting and Cleaning Data.

This repository contains the following four files:

* README.md - provides an overview of the data set and how it is compiled
* CodeBook.md - describes the content of the data set (data, variables and transformations used)
* run_analysis.R - R script used to create the data set
* tidy_data.txt - data set

## Background of Data Set
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here is the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Creating Data Set

The R script run_analysis.R is used to create the data set. 
It retrieves the source data set and transforms it to produce the final data set (see the Code book for details).

## Final Data Set

The tidy_data.txt in this repository was created by running the run_analysis.R script using R version 3.4.3 on Windows 10 64-bit edition.
