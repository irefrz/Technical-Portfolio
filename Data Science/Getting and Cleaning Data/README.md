   Getting and Cleaning Data Final Project
   Human Activity Recognition Using Smartphones Data Set
   
   Source Script: run_analysis.R
   
   Data Files:
   	- ‘features_info.txt’: Shows information about the variables used on the feature vector.
   	- 'features.txt': List of all features (variables)
   	- 'activity_labels.txt': Links the activity class labels with their activity name.
   	- 'X_train.txt': Training set.
   	- 'y_train.txt': Training labels (activity class labels).
   	- ‘subject_train.txt’: Subject labels 
   	- 'X_test.txt': Test set.
   	- 'y_test.txt': Test labels (activitiy class labels).
   	- ‘subject_test.txt’: Subject labels 
   
   Execution Steps:
   
   1. Load and Install Packages and Libraries: Load necessary packages and libraries to execute the script.
   
   2. Import the  Test Data: Read the test set, the test labels, and the test subjects into character vectors. Parse the test vector (test) in order to create the test matrix (test_mat). Convert the subject and character vectors to data frames (df1, df2). Convert the test matrix (test_mat) to a data frame (df3). Merge the data frames df1, df2, and df3 using cbind to create the final data frame containing all the test data (test_df).
   
   3. Import the  Training Data: Read the training set, training labels, and the training subjects into character vectors. Parse the training vector (train) in order to create the training matrix (train_mat). Convert the subject and character vectors to data frames (df4, df5). Convert the train matrix (train_mat) to a data frame (df6). Merge the data frames df4, df5, and df6 using cbind to create the final data frame containing all the training data (train_df).
      
   4. Merge and Label Complete Dataframe: Merge the test data frame and the training data frame to create the data frame containing all the combined data (human_activity_recog_df). Read the features data to label the variables in the human_activity_recog_df data frame. Create column names for the ‘Subject’ and the ‘Activity’ variables. Apply the subject, activity, and features labels to the variables (columns in the data frame).
   
   5. Apply Average (mean) to Each Mean and Standard Deviation Measurement: Extract each mean and standard deviation measurement into the quantify_df data frame. Group the quantify_df data frame data by subject and activity. Summarize each group and apply the mean function to the values resulting in the average_df data frame.
      
   6. Label Activity Values by Name: Read the activity labels and insert these in the activity_label data frame by matching the activity class labels resulting in preparing an additional feature column for inserting into the tidy_data_df data frame.
      
   7. Check Final Data Frame Dimensions: Confirm dimensions of final data frame before creating the tidy data text file. Results = 180 x 81.
      
   8. Write the Tidy Data: Create the tidy_data_df data frame from the activity_label data frame and the average_df data frame. Write the tidy_data_df as a text file to the local directory (tidy_data.txt).
      
   9. View Tidy Data (Optional): Read and view the tidy_data.txt file.
      
   	
   
   References:
   
    Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. Retrieved from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
   
   Hood, D. Coursera-John Hopkins University-Getting and Cleaning Data. David's personal course project FAQ. Retrieved from https://class.coursera.org/getdata-013/forum/thread?thread_id=30
   Hood, D. Coursera-John Hopkins University-Getting and Cleaning Data. Tiny Data and the Assignment. Retrieved from https://class.coursera.org/getdata-013/forum/thread?thread_id=31
   
      
      
