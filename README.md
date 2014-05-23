## About this repository

This repository contains deliverables created for the project of the
course "Getting and Cleaning Data", from John Hopkins University (John
Hopkins Bloomberg School of Public Health). Those deliverables are
listed below:

-   README.md: this file

-   CodeBook.md: the code book describing the data sources utilized, all
    data transformations performed and the output produced. It also
    describes naming conventions for activity and feature labels.

-   run\_analysis.R: an R script that perform the processing and create
    deliverables as requested in the project description.

## How to run the R script

Before running the script, you need to download and unzip the data to be
processed. This data set is named "UCI HAR Dataset.zip", and can be
downloaded from the "Human Activity Recognition Using Smartphones"
[repository][]

Once unzipped, it creates a directory called "UCI HAR Dataset". You
should put "run\_analysis.R" inside this directory before running it.

After running the script, a file named "tidy\_data\_mean.csv" will be
created in that directory.

  [repository]: http://archive.ics.uci.edu/ml/machine-learning-databases/00240/
