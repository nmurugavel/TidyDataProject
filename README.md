---
title: "README"
output: html_document
---

### Getting and cleaning data course project

The goal is to prepare a tidy data set that can be used for later analysis. This uses the data collected by Samsung as input to prepare the tidy data set.


The following files are included:
=================================

1. run_analysis.R
This contains the function to load the training and testing data, merges them into one, computes the means of the measures and generates a tidy data set.
Function name:  run_analysis
Parameters:     none
Returns:        tidy data set in a data frame

2. CodeBook.md
The code book of the tidy data set returned by the run_analysis function.

3. Tidy_DataSet.txt
The tidy data set saved in a text file. Refer to CodeBook.md for details.


Notes:
======
1. The program uses the Samsung data and assumes that the "UCI HAR Dataset" directory is present in the current working directory.

2. Only the body acceleration measures are extracted for each observation.
