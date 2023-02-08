
?read.csv()
#Method 1: Select The file manually

stats <- read.csv(file.choose())
stats

#Method 2 : Set WD and Read Data

setwd("C:\\Users\\sidha\\OneDrive\\Documents\\Documents\\R")
getwd()
rm(stats)

stats <- read.csv("P2-Demographic-Data.csv",stringsAsFactors=T)
stats

#-------------------------------------------Exploring Data

stats
nrow(stats)
ncol(stats)
head(stats) #top 5 rows
tail(stats) #bottom 5 rows

head(stats,n=10)
tail(stats,n=8)
str(stats)
summary(stats)


#-------------------Using the $ sign
stats
head(stats)
stats[3,3]
stats[3,'Birth.rate']
stats$Internet.users
stats$Internet.users[2]

stats[,'Internet.users']

levels(stats$Income.Group)


#---------------Basic Operations with a DF

stats[1:10,] #subsetting
stats[3:9,]
stats[c(4,100),]

#remember how the [] works?
is.data.frame(stats[1,]) #no need for drop=F

is.data.frame(stats[,1])
is.data.frame(stats[,1,drop=F])

#multiply colums
stats$Birth.rate * stats$Internet.users

#add column
stats$Mycalc <- stats$Birth.rate * stats$Internet.users
head(stats)

#test of knowledge
stats$xyz <- 1:5
head(stats)
head(stats,n=12)


#remove a column

head(stats)
stats$Mycalc <- NULL
stats$xyz <- NULL


#-------------------Filetering Data Frames


head(stats)
filter <- stats$Internet.users <2
stats[1:100,]
stats[filter,]

stats[filter <- stats$Birth.rate >40,]

stats[filter <- stats$Birth.rate >40 & stats$Internet.users <2,]


stats[stats$Income.Group == "High income",]
levels(stats$Income.Group)
stats[stats$Country.Name == "Malta",]


#-------------------------------Introduction to qplot()
#install.packages("ggplot2")
library(ggplot2)
?qplot()

qplot(data = stats, x= Internet.users)
qplot(data = stats, x= Income.Group,y=Birth.rate)
qplot(data = stats, x= Income.Group,y=Birth.rate,size=I(3))
qplot(data = stats, x= Income.Group,y=Birth.rate,size=I(3),colour = I("Blue"))      


qplot(data = stats, x= Income.Group,y=Birth.rate,geom = "boxplot")

#--------------------Visualizing what we need

qplot(data = stats, x= Internet.users,y=Birth.rate)
qplot(data = stats, x= Internet.users,y=Birth.rate,size= I(4))
qplot(data = stats, x= Internet.users,y=Birth.rate,colour=I("red"),size= I(4))
qplot(data = stats, x= Internet.users,y=Birth.rate,colour=Income.Group,size= I(4))


#------------------Creating Data Frame
mydf <-data.frame(Countries_2012_Dataset,Codes_2012_Dataset,Regions_2012_Dataset)
head(mydf)
#colnames(mydf) <- c("Country","Codes","Region")
#head(mydf)
rm(mydf)
mydf <- data.frame(Country = Countries_2012_Dataset,Code=Codes_2012_Dataset,Region = Regions_2012_Dataset,stringsAsFactors=T)
head(mydf)
summary(mydf)

#--------------Merging Data Frame
head(stats)
head(mydf)
merged <- merge(stats,mydf,by.x="Country.Code",by.y="Code")
head(merged)

merged$Country <- NULL
str(merged)

#-----------------Visualizing with new split
qplot(data=merged,x=Internet.users,y=Birth.rate)
qplot(data=merged,x=Internet.users,y=Birth.rate,colour=Region)

#1.shapes
qplot(data=merged,x=Internet.users,y=Birth.rate,colour=Region,size=I(2),shape=I(17))

#2.Transparency
qplot(data=merged,x=Internet.users,y=Birth.rate,colour=Region,
      size=I(2),shape=I(19),
      alpha=I(0.6),main= "Birthrate vs Internet Users")
