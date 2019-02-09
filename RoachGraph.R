library(ggplot2)
library(plyr)         #gives access to the count function

frame2 <- data.frame(waterstats$avgdailypercent)
frame1 <- data.frame(waterstats$status)

newFrame <- data.frame(frame1, frame2)  #creates data frame with needed info
newFrame <- aggregate(waterstats[, 6], list(waterstats$status), mean)
colnames(newFrame)<-c("status","mean")

ggplot(newFrame, aes(x=newFrame$status, y=newFrame$mean, fill= factor(status)))+stat_summary( geom="bar")+
  ylab("Percent body weight lost")+xlab("Reproductive Status")