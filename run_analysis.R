

directory<-"UCI HAR Dataset"
subdirectory<-c("test","train")
activity_labels<-read.table(paste(directory,"//","activity_labels.txt",sep=""))
feature_heading<-read.table(file=paste(directory,"//","features.txt",sep=""))
finaldataframe<-NULL
for(subdir in subdirectory)
{
    data<-read.table(paste(directory,"/",subdir,"/","X_",subdir,".txt",sep=""))
    data_activity<-read.table(paste(directory,"/",subdir,"/","y_",subdir,".txt",sep=""))
    data_subject<-read.table(paste(directory,"/",subdir,"/","subject_",subdir,".txt",sep=""))
    #colnames(data)<-feature_heading[,2]
    v_testactivity<-data_activity[,1]
    activities<-factor(v_testactivity)
    #levels(activities)<-activity_labels[,2]
    v_testactivity<-factor(v_testactivity,labels=activity_labels[,2])
    data<-cbind(v_testactivity,data)
    data<-cbind(data_subject[,1],data)
    finaldataframe<-rbind(finaldataframe,data)
}

colnames(finaldataframe)<-c("subject","activity",as.character(feature_heading[,2]))

finaldataframe<-finaldataframe[,c(1,2,grep("mean",colnames(finaldataframe)),grep("std",colnames(finaldataframe)))]

library("reshape2")
library("plyr")
melted<-melt(finaldataframe,id.vars=c("activity","subject"))
tidy<-ddply(melted,c("activity","subject","variable"),summarise,mean=mean(value))
write.table(tidy,file="tidy.txt")



