# GetAndCleanData
This repos is made for Assignment of getting and cleaning data

run_analyris.R is made for the dataset ["Human Activity Recognition Dataset"](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
The code is used to get "tidy" data from this raw material.

1. Test data and training data were merged.
2. Only 79 measurements which is on the mean and standard deviation are extracted from its result.
3. Each data are averaged according to each activities(activity_labels.txt) and subjects(subject_train.txt, subject_test.txt).
4. parameter name "subject" and "activities" are made for specifying independent index.
