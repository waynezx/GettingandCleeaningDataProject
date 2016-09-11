 Getting-and-Cleaning-Data-Course-Project
# Source Data
# A full description of the data used in this project can be found at 
# http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
# x_train, y_train, x_test, y_test, subject_train and subject_test include the data from the downloaded original files.
# data_x, data_y and dataSubject merge the original test and train datasets.
# features contains the correct names for the data_x dataset, which are applied to the column names stored in features_mean_std, a numeric vector used to extract the desired data.
# The same way applies to activity names through the activities variable.
# finaldata merges data_x, data_y and dataSubject in a single dataset.
# Datatidy contains the mean and std averages which is later stored in a .txt file. aggregate() from the plyr package is used to calculate the mean.