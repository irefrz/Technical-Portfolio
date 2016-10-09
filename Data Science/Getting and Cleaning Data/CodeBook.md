Getting and Cleaning Data Final Project
Human Activity Recognition Using Smartphones Data Set

Variable Descriptions for script run_analysis.R resulting in tiny_data.txt
   
1. Background and Description of Source Data:
   
   The researchers responsible for compiling and preparing the source data describe it as:
   
   “Abstract: Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.” (Anguita, Ghio, Oneto, Parra & Reyes-Ortiz, 2013)

   In addition they provide the following data description along with the data:
   
   The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
   
   Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
   
   Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
   
   These signals were used to estimate variables of the feature vector for each pattern:  
   '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
   
   tBodyAcc-XYZ
   tGravityAcc-XYZ
   tBodyAccJerk-XYZ
   tBodyGyro-XYZ
   tBodyGyroJerk-XYZ
   tBodyAccMag
   tGravityAccMag
   tBodyAccJerkMag
   tBodyGyroMag
   tBodyGyroJerkMag
   fBodyAcc-XYZ
   fBodyAccJerk-XYZ
   fBodyGyro-XYZ
   fBodyAccMag
   fBodyAccJerkMag
   fBodyGyroMag
   fBodyGyroJerkMag
   
   The set of variables that were estimated from these signals are: 
   
   mean(): Mean value
   std(): Standard deviation
   mad(): Median absolute deviation 
   max(): Largest value in array
   min(): Smallest value in array
   sma(): Signal magnitude area
   energy(): Energy measure. Sum of the squares divided by the number of values. 
   iqr(): Interquartile range 
   entropy(): Signal entropy
   arCoeff(): Autorregresion coefficients with Burg order equal to 4
   correlation(): correlation coefficient between two signals
   maxInds(): index of the frequency component with largest magnitude
   meanFreq(): Weighted average of the frequency components to obtain a mean 	frequency
   skewness(): skewness of the frequency domain signal 
   kurtosis(): kurtosis of the frequency domain signal 
   bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each 	window.
   angle(): Angle between to vectors.
   
   Additional vectors obtained by averaging the signals in a signal window sample. These 	are used on the angle() variable:
   
   gravityMean
   tBodyAccMean
   tBodyAccJerkMean
   tBodyGyroMean
   tBodyGyroJerkMean
   
   
2. Study Design
   
	Data Files:
- ‘features_info.txt’: Type = informational
Shows information about the variables used on the feature vector.

	- 'features.txt': Type = data, Dimension = 561
	List of all features (variables)

	- 'activity_labels.txt': Type = data, Dimension = 6
	Links the activity class labels with their activity name.

	- 'X_train.txt': Type = data, Dimension = 7352 x 561
	 Training set.

	- 'y_train.txt': Type = data, Dimension = 7352 x 1
	Training labels (activity class labels).
	- ‘subject_train.txt’: Type = data, Dimension = 7352 x 1
	Subject labels 

	- 'X_test.txt': Type = data, Dimension = 2947 x 561
	Test set.

	- 'y_test.txt': 
	Test labels (activitiy class labels). 2947 x 1

	- ‘subject_test.txt’: 2947 x 1
	Subject labels 

	The initial project requirement states that the training and test data set should be merged. An evaluation of the train data set showed that X_train.txt contained the observations. y_train and subject_train contained the same number of rows as X_train and therefore fitted the observation data as 2 additional variables (columns) providing the activity and subject data respectively. The same pattern held true for the test data. Once these sets of data where merged, the resulting data dimensions where 10,299 x 561.

Extracting variables (columns) that were mean() or standard() deviations produced a data set with dimension of 10,299 x 81. Grouping this data set by subject and activity and then applying the mean function to each group produced the final data set of 180 x 81.

   
3. Tidy Data Set

Dimensions: 180 x 81

	Categorical Data Types:

	Subject - The identification number of the subject performing the activity
	Activity – The activity number
	Activity.Name – The activity name

Where Subject and Activity provide the grouping to apply the average (mean function) to each group resulting in the following variables. Each is a mean value of the original set of observations.:

	Real Number Data Types:

   tBodyAcc-XYZ.std() 
   tGravityAcc-XYZ.std()
   tBodyAccJerk-XYZ.std()
   tBodyGyro-XYZ.std()
   tBodyGyroJerk-XYZ.std()
   tBodyAccMag.std()
   tGravityAccMag.std()
   tBodyAccJerkMag.std()
   tBodyGyroMag.std()
   tBodyGyroJerkMag.std()
   fBodyAcc-XYZ.std()
   fBodyAccJerk-XYZ.std()
   fBodyGyro-XYZ.std()
   fBodyAccMag.std()
   fBodyBodyAccJerkMag.std()
   fBodyBodyGyroMag.std()
   fBodyBodyGyroJerkMag.std()
   tBodyAcc-XYZ.mean()
   tGravityAcc-XYZ.mean ()
   tBodyAccJerk-XYZ.mean ()
   tBodyGyro-XYZ.mean ()
   tBodyGyroJerk-XYZ.mean ()
   tBodyAccMag.mean ()
   tGravityAccMag.mean()
   tBodyAccJerkMag.mean ()
   tBodyGyroMag.mean()
   tBodyGyroJerkMag.mean()
   fBodyAcc-XYZ.mean ()
   fBodyAccJerk-XYZ.std()
   fBodyGyro-XYZ.mean()
   fBodyAccMag.mean()
   fBodyBodyAccJerkMag.mean()
   fBodyBodyGyroMag.mean()
   fBodyBodyGyroJerkMag.mean()
   fBodyAcc-XYZ.meanFreq()
   fBodyAccJerk-XYZ.meanFreq ()
   fBodyGyro-XYZ.meanFreq()
   fBodyAccMag.meanFreq()
   fBodyBodyAccJerkMag.meanFreq()
   fBodyBodyGyroMag.meanFreq()
   fBodyBodyGyroJerkMag.meanFreq()
   
   
   The original set of variables that were estimated from these signals are: 
   
   mean(): Mean value
   std(): Standard deviation
   meanFreq(): Weighted average of the frequency components to obtain a mean 	frequency

References:

 Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. Retrieved from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
   
