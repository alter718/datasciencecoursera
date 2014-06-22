###Creates a tidy data table from 6 input files.

The script run_analysis.R takes in a total of 6 files from the UCI HAR dataset.

The subject files (test and train) are read in and row bound to create a listing of all User IDs.
The y files (test and train) are also read in and row bound to create a column of Activity IDs.
The two resulting files are given column names and column bound into a df named 'labels'.
The Activity IDs (number values) are remapped to descriptive labels ('walking', 'laying', etc.).
The x files (actual sensor recordings) are read in, row bound and then subsetted to include only values with
means and standard deviations.

Column names are provided for the data and column bound to the labels df.
ddply is run on the resulting df to calculate means for each activity for each user.

Finally a tab-delimited txt file is written out. The row names are omitted to make for better
legibility in Excel.
