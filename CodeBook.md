## 1. Introduction

This is the code book for the final project of the course "Getting and
Cleaning Data", from John Hopkins University (John Hopkins Bloomberg
School of Public Health).

The purpose of this code book is:

-   to explain all data transformations performed to the initial data to
    get to the final result, as presented in the file
    "tidy\_data\_mean.csv".

-   to describe the naming convention and meaning of all features and
    activities in the final dataset, as seen in the header of the file
    "tidy\_data\_mean.csv".

## 2. Data Sources

Data sources for this project were obtained from some files obtained
after unzipping the data set named "UCI HAR Dataset.zip", downloaded
from the "Human Activity Recognition Using Smartphones" [repository][]

The necessary files are:

-   "features.txt"

-   "activity\_labels.txt"

-   "./train/X\_train.txt"

-   "./train/y\_train.txt"

-   "./train/subject\_train.txt"

-   "./test/X\_test.txt"

-   "./test/y\_test.txt"

-   "./test/subject\_test.txt"

## 3. Steps for Data Transformation

The R script named "run\_analysis.R" perform all data transformations
according to the steps shown below:

1.  **Read input data:** "X\_train.txt" and "X\_test.txt" are merged
    into a single data set; the same is done for "y\_train.txt" with
    "y\_test.txt" and "subject\_train.txt" with "subject\_test.txt";
    "features.txt" and "activity\_labels.txt" are read as is.

2.  **Rename activities:** for each activity label listed in
    "activity\_labels.txt", rename it to be more readable; the naming
    convention used is described on item "4. Feature and Activity Naming
    Convention" of this document.

3.  **Find features of interest:** Get only the feature names in
    "features.txt" that contains "mean()" and "std()" substrings.

4.  **Rename features of interest:** for each feature label found in
    step 2 above, rename it to be more readable; the naming convention
    used is described on item "4. Feature and Activity Naming
    Convention" of this document.

5.  **Build the first tidy data set:** this data set has the subject
    data as the first column, the activities numbers as the second
    column, and the features of interest (selected in step 4) as the
    remaining columns.

6.  **Build the second tidy data set:** this data set has the mean of
    all activities for all subjects, with the feature columns arranged
    in alphabetical order; the activity numbers are replaced by their
    corresponding labels (as defined in setp 2).

7.  **Save the second tidy data set:** finally the second tidy data set
    (as created in step 6) is saved to disk as a CSV file in the working
    directory as "tidy\_data\_mean.csv".

## 4. Feature and Activity Naming Convention

There are many coding and naming conventions when it comes to
programming languages, databases, and data itself. For this project, I
have chosen two different conventions that are well accepted by the R
community and are described in the [Google's R Style Guide][]

### 4.1 Naming convention for feature labels

Feature labels follow the "feature.label" pattern, where a label is
comprised of sub-strings separated by period ("."). This convention
yields in particularly easy to read labels, specially when they are
comprised of several sub-strings (which is the case in this project). By
following this convention, feature labels in R data frame objects always
have valid names and better readability in code, as the following
example shows:

    tidy.data.mean$f.body.gyro.jerk.mag.mean[1:10]

### 4.2 Naming convention for activity labels

Activity labels follows the camel case convention, as in the
"activityLabel" pattern. This allows for a differentiation between them
and feature labels in the data set, as well as between them and
identifier names in R code.

### 4.3 List of feature labels in the "tidy\_data\_mean.csv" data set:

    f.body.acc.jerk.mag.mean
    f.body.acc.jerk.mag.std
    f.body.acc.jerk.mean.x
    f.body.acc.jerk.mean.y
    f.body.acc.jerk.mean.z
    f.body.acc.jerk.std.x
    f.body.acc.jerk.std.y
    f.body.acc.jerk.std.z
    f.body.acc.mag.mean
    f.body.acc.mag.std
    f.body.acc.mean.x
    f.body.acc.mean.y
    f.body.acc.mean.z
    f.body.acc.std.x
    f.body.acc.std.y
    f.body.acc.std.z
    f.body.gyro.jerk.mag.mean
    f.body.gyro.jerk.mag.std
    f.body.gyro.mag.mean
    f.body.gyro.mag.std
    f.body.gyro.mean.x
    f.body.gyro.mean.y
    f.body.gyro.mean.z
    f.body.gyro.std.x
    f.body.gyro.std.y
    f.body.gyro.std.z
    t.body.acc.jerk.mag.mean
    t.body.acc.jerk.mag.std
    t.body.acc.jerk.mean.x
    t.body.acc.jerk.mean.y
    t.body.acc.jerk.mean.z
    t.body.acc.jerk.std.x
    t.body.acc.jerk.std.y
    t.body.acc.jerk.std.z
    t.body.acc.mag.mean
    t.body.acc.mag.std
    t.body.acc.mean.x
    t.body.acc.mean.y
    t.body.acc.mean.z
    t.body.acc.std.x
    t.body.acc.std.y
    t.body.acc.std.z
    t.body.gyro.jerk.mag.mean
    t.body.gyro.jerk.mag.std
    t.body.gyro.jerk.mean.x
    t.body.gyro.jerk.mean.y
    t.body.gyro.jerk.mean.z
    t.body.gyro.jerk.std.x
    t.body.gyro.jerk.std.y
    t.body.gyro.jerk.std.z
    t.body.gyro.mag.mean
    t.body.gyro.mag.std
    t.body.gyro.mean.x
    t.body.gyro.mean.y
    t.body.gyro.mean.z
    t.body.gyro.std.x
    t.body.gyro.std.y
    t.body.gyro.std.z
    t.gravity.acc.mag.mean
    t.gravity.acc.mag.std
    t.gravity.acc.mean.x
    t.gravity.acc.mean.y
    t.gravity.acc.mean.z
    t.gravity.acc.std.x
    t.gravity.acc.std.y
    t.gravity.acc.std.z

### 4.4 Naming dictionary for the feature labels:

`SUB-STRING: MEANING`

`f: value is in the frequency domain`

`t: value is in the time domain`

`body: measurement with respect to the body mass of the subject`

`gravity: measurement with respect to the gravity force`

`acc: acceleration`

`gyro: angular velocity`

`jerk: rate of change`

`mag: magnitude (using Euclidean Norm)`

`mean: mean value`

`std: standard deviation`

`x: x-direction in the 3-axial coordinate system`

`y: y-direction in the 3-axial coordinate system`

`z: z-direction in the 3-axial coordinate system`

### 4.5 List of activity labels in the "tidy\_data\_mean.csv" data set:

    walking
    walkingUpstairs
    walkingDownstairs
    sitting
    standing
    laying

The activity labels are self-explanatory. They represent the action a
given subject was performing when a given measurement was taken. These
measurements are described in items 4.3 and 4.4 above.

  [repository]: http://archive.ics.uci.edu/ml/machine-learning-databases/00240/
  [Google's R Style Guide]: https://google-styleguide.googlecode.com/svn/trunk/Rguide.xml
