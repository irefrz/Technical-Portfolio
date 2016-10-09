## 1. LOAD AND INSTALL PACKAGES AND LIBRARIES
install.packages("stringr")
library(stringr)
install.packages("miscTools")
library(miscTools)

library(dplyr)
library(data.table)

## 2. IMPORT THE TEST DATA

### X_test - measurements for each row
con <<- file("X_test.txt", "r")
test <<- readLines(con)
close(con)

### y_test - activity for each row
con <<- file("y_test.txt", "r")
activity <- readLines(con)
close(con)

### subject_test - subject for each row
con <<- file("subject_test.txt", "r")
subject <- readLines(con)
close(con)

## result = 2947 row count
test_rows <<- length(test)

test_mat <<- matrix(NA, nrow=test_rows, ncol=561, byrow=T)

for (i in 1:test_rows ){
s <<- str_replace_all(str_trim(test[[i]]),"  ", " ")
ssplit <<- strsplit(s," ", fixed=TRUE)
	for (j in 1:561){
		s1 <<- ssplit[[1]][j]
		test_mat[i,j] <- rbind(s1)
	}
}

df1 <<- as.data.frame(subject)
df2 <<- as.data.frame(activity,stringAsFactors=FALSE)
df3 <<- as.data.frame(test_mat)
test_df <<- cbind(df1, df2, df3)



## 3. IMPORT THE TRAINING DATA
#### X_train - measurements for each row
con <<- file("X_train.txt", "r")
train <<- readLines(con)
close(con)

### y_train - activity for each row
con <<- file("y_train.txt", "r")
activity <<- readLines(con)
close(con)

### y_train - subject for each row
con <<- file("subject_train.txt", "r")
subject <<- readLines(con)
close(con)

## result = 7352 row count
train_rows <<- length(train)

train_mat <<- matrix(NA, nrow=train_rows, ncol=561, byrow=T)

for (i in 1:train_rows ){
s <<- str_replace_all(str_trim(train[[i]]),"  ", " ")
ssplit <<- strsplit(s," ", fixed=TRUE)
	for (j in 1:561){
		s1 <<- ssplit[[1]][j]
		train_mat[i,j] <- rbind(s1)
	}

}

df4 <<- as.data.frame(subject)
df5 <<- as.data.frame(activity, stringAsFactors=FALSE)
df6 <<- as.data.frame(train_mat)
train_df <<- cbind(df4, df5, df6)


## 4. MERGE AND LABEL COMPLETE DATAFRAME
human_activity_recog_df <<- rbind(test_df, train_df)

## Apply variable (columns) labels
###### features.txt file

con <<- file("features.txt", "r")
features <<- readLines(con)
close(con)

subject_name <<- c("Subject")
activity_name <<- c("Activity")
colnames(human_activity_recog_df) <- c(subject_name, activity_name,features)

## 5. APPLY AVERAGE (MEAN) TO EACH MEAN AND STANDARD DEVIATION MEASUREMENT

## Extact mean and standard deviation measurements
quantify_df <<- select(human_activity_recog_df, contains("Subject"), contains("Activity"), contains("std()"), contains("mean()") , contains("meanFreq()") )

## Apply mean() 
groups_df <<- group_by(quantify_df, Subject, Activity)
average_df <<- summarise_each(groups_df, funs(mean))

## 6. LABEL ACTIVITY VALUES BY NAME
con <<- file("activity_labels.txt", "r")
activity <<- readLines(con)
close(con)

activity_label <<- data.frame(c(average_df[,2], stringAsFactors=FALSE))

for (i in 1:6) {
	val <<- as.numeric(str_sub(activity[i],1,1))
	subgrp <<- activity_label$Activity%in%val
	activity_label[subgrp,2] <- str_sub(activity[i],3)
}

## Clean column names
for (i in 3:ncol(average_df)) {
	stemp <<- strsplit(colnames(average_df)[i], " ",fixed=TRUE)
	colnames(average_df)[i] <-  stemp[[1]][2]
}


## 7. CHECK FINAL DATA FRAME DIMENSION 
dim(average_df)
##dim = (180 x 81)

## 8. WRITE TIDY DATA
tidy_data_df <<- data.frame(average_df[,1],  activity_label, average_df[,3:81])
setnames(tidy_data_df,"stringAsFactors","Activity Name")
write.table(tidy_data_df, file="tidy_data.txt", sep = " ", eol = "\n", dec = ".", col.names=TRUE, row.names=FALSE)

## 9. VIEW TIDY DATA (Optionable)
data_table <<- read.table("tidy_data.txt", header = TRUE)
View(data_table)

