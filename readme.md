---
title: "readme"
author: "Sourav"
date: "26 October 2017"
output: html_document
---

This file gives and overview of what the code does 

Assumptions:

It assumes that the data has been downloaded and unzipped 
it assumes that the Directory "UCI HAR Dataset" is in the working directory 


Function:

It downloads the 3 test files and 3 train files
it merges the data sets into three different dataframes of XFull, YFull and SubFull
Partial string matching using grep is used to indentify columns containing "mean()" or "std()"

This is picked up and assigned to a new data frame called "XMeansd"

The activity label in the dataframe Yfull ( merged data set of Ytrain and Ytest) is converted to Factor 

Using library plyr, corresponding activity found in the file activity_labels.txt is identified and updated to the data frame "XMeansd"

The mean for each activity and subject is found using the reshape2 library and this is populated in another data frame called "tidydata.txt"

