library(stringr)
library(dplyr)
library(data.table)

subj_test <- read.table("test/subject_test.txt")
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subj_train <- read.table("train/subject_train.txt")
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
x_names <- read.table("features.txt")

testdat <- cbind(subj_test, y_test, rep("test", 2947))
names(testdat) <- c("subject", "activity", "group")
testdat <- cbind(testdat, x_test)

traindat <- cbind(subj_train, y_train, rep("train", 7352))
names(traindat) <- c("subject", "activity", "group")
traindat <- cbind(traindat, x_train)

## remove unnecessary dataframes from the environment
rm(subj_test, subj_train, x_test, x_train, y_test, y_train)

dat <- rbind(testdat, traindat)
dat$activity <- as.character(dat$activity)


## replace activity names
dat$activity <- str_replace_all(dat$activity, "1", "walking")
dat$activity <- str_replace_all(dat$activity, "2", "walking_upstairs")
dat$activity <- str_replace_all(dat$activity, "3", "walking_downstairs")
dat$activity <- str_replace_all(dat$activity, "4", "sitting")
dat$activity <- str_replace_all(dat$activity, "5", "standing")
dat$activity <- str_replace_all(dat$activity, "6", "laying")

dat$activity <- as.factor(dat$activity)
dat$group <- as.factor(dat$group)

b <- as.character(x_names$V2)
names(dat) <- c("subject", "activity", "group", b)

## identify the column names which measure mean or standard deviation
meancols <- grep("mean", names(dat), value=TRUE)
sdcols <- grep("std", names(dat), value=TRUE)
dat <- dat[,c("subject", "activity", "group", meancols, sdcols)]
names(dat) <- str_replace_all(names(dat), "-", "_")
names(dat) <- str_replace_all(names(dat), "[()]", "")

dat <- as.data.table(dat)

run_dat <- dat[, lapply(.SD, mean), by=c("subject", "activity")]

## replace group observations converted to integers by data.table
run_dat$group <- as.character(run_dat$group)
run_dat$group <- str_replace_all(run_dat$group, "1", "test")
run_dat$group <- str_replace_all(run_dat$group, "2", "train")
run_dat$group <- as.factor(run_dat$group)


