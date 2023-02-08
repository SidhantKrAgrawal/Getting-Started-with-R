getwd()
setwd("C:\\Users\\sidha\\OneDrive\\Documents\\Documents\\R")

movies <- read.csv("P2-Movie-Ratings.csv",,stringsAsFactors=T)
head(movies)
colnames(movies) <- c("Film","Genre","CriticRating","AudienceRating","BudgetMillions","Year")
head(movies)
tail(movies)
str(movies)
summary(movies)

# Factor
factor(movies$Year)
movies$Year <- factor(movies$Year)
summary(movies)

# Aesthetics
library(ggplot2)

ggplot(data= movies, aes(x=CriticRating,y=AudienceRating))
#add geometry
ggplot(data= movies, aes(x=CriticRating,y=AudienceRating)) +
  geom_point()


#add colour
ggplot(data= movies, aes(x=CriticRating,y=AudienceRating,colour=Genre)) +
  geom_point()

#add size
ggplot(data= movies, aes(x=CriticRating,y=AudienceRating,colour=Genre,
                    size=Genre)) +
  geom_point()

#add size - better way
ggplot(data= movies, aes(x=CriticRating,y=AudienceRating,colour=Genre,
                         size=BudgetMillions)) +
  geom_point()

#>>> This is #1 we will improve it

p <- ggplot(data= movies, aes(x=CriticRating,y=AudienceRating,colour=Genre,
                              size=BudgetMillions))
#point
p + geom_point()


#lines
p + geom_line()

#multiple layers
p + geom_point() + geom_line()
p +  geom_line()+ geom_point() 


#------------------ Overriding Aesthetics

q <- ggplot(data=movies , aes(x=CriticRating,y=AudienceRating,
                              colour=Genre,size=BudgetMillions))

#add geom layer
q+geom_point()

#overriding aes
#ex1
q + geom_point(aes(size=CriticRating))

#ex2
q + geom_point(aes(colour=BudgetMillions))

# q remains same
q + geom_point()

#ex3
q + geom_point(aes(x=BudgetMillions)) + xlab("Budget millions$$$")

#ex4
q +  geom_line()+ geom_point() 
#reduce line size
q +  geom_line(size = 1)+ geom_point() 


# ------------Mapping vs Setting

r <- ggplot(data= movies,aes(x=CriticRating,y=AudienceRating))
r + geom_point()

#Add colour

#1. Mapping
r + geom_point(aes(colour=Genre))

#2. Setting
r + geom_point(colour = "DarkGreen")
#ERROR:
#r + geom_point(aes(colour="DarkGreen"))

#1. Mapping
r + geom_point(aes(size = BudgetMillions))
# 2. setting
r + geom_point(size=10)

#ERROR
#r + geom_point(aes(size=10))

#-----------Histograms and Density Charts

s <- ggplot(data= movies,aes(x=BudgetMillions))
s + geom_histogram(binwidth=10)


#addcolour
s + geom_histogram(binwidth=10, aes(fill=Genre))


#add a border
s + geom_histogram(binwidth=10, aes(fill=Genre),colour= "Black")

#>>>>3 (we will improve it)

#sometime you may need density charts:

s + geom_density(aes(fill=Genre))
s + geom_density(aes(fill=Genre),position = "stack")

#------------------starting layer tips

t <- ggplot(data= movies,aes(x=AudienceRating))
t + geom_histogram(binwidth = 10,fill="White",colour="Blue")


#another way

t <- ggplot(data= movies)
t + geom_histogram(binwidth = 10,fill="White",colour="Blue",aes(x=AudienceRating))

#>>>> 4 
t + geom_histogram(binwidth = 10,fill="White",colour="Blue",aes(x=CriticRating))

#>>>>> 5
t <- ggplot()



#--------------------statistical transformation


u <- ggplot(data=movies,aes(x=CriticRating,y=AudienceRating,colour=Genre))
u + geom_point() + geom_smooth(fill = NA)


# boxplots

u <- ggplot(data = movies,aes(x= Genre,y=AudienceRating,colour = Genre))
u + geom_boxplot()
u + geom_boxplot(size=1.2)
u + geom_boxplot(size=1.2) + geom_points()

# tip 
u + geom_boxplot(size=1.2) + geom_jitter()


#another way
u  + geom_jitter()+ geom_boxplot(size=1.2,alpha= 0.5)

#--------------Using Facets
v <- ggplot(data=movies,aes(x=BudgetMillions))
v + geom_histogram(binwidth = 10,aes(fill= Genre),colour= "Black")

#facets
v + geom_histogram(binwidth = 10,aes(fill= Genre),colour= "Black") +
  facet_grid(Genre~.,scales = "free")

#scatterplots
w <- ggplot(data= movies,aes(x=CriticRating,y=AudienceRating,colour=Genre))

w + geom_point(size = 3)

#facets
w + geom_point(size = 3) + facet_grid(Genre~.)

w + geom_point(size = 3) + facet_grid(.~Year)

w + geom_point(size = 3) + facet_grid(Genre~Year)

w + geom_point(size = 3) + geom_smooth() + facet_grid(Genre~Year)

w + geom_point(aes(size = BudgetMillions)) + geom_smooth() + facet_grid(Genre~Year)


#-----------Coordinates

m <- ggplot(data= movies,aes(x=CriticRating,y=AudienceRating,size= BudgetMillions,colour= Genre))

m + geom_point()


m + geom_point() + xlim(50,100) + ylim(50,100)
# wont work well

n <- ggplot(data= movies,aes(x=BudgetMillions))
n+ geom_histogram(binwidth = 10,aes(fill=Genre),colour= "Black") + ylim(0,50)


# instead zoom
n+ geom_histogram(binwidth = 10,aes(fill=Genre),colour= "Black") + 
  coord_cartesian(ylim=c(0,50))

w + geom_point(aes(size = BudgetMillions)) + geom_smooth() + facet_grid(Genre~Year) +
  coord_cartesian(ylim=c(0,100))

#---------------------- Theme

o <- ggplot(data = movies,aes(x= BudgetMillions))
h <- o + geom_histogram(binwidth = 10,aes(fill= Genre),colour = "Black")

h 
# axes label
h + xlab("Money Axis") + ylab("No of movies") + 
  theme(axis.title.x = element_text(colour="DarkGreen",size=30),
          axis.title.y = element_text(colour = "Red",size = 30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20))


# Legend Formatting
h + xlab("Money Axis") + ylab("No of movies") + ggtitle("Movie Budget Distribution") +
  theme(axis.title.x = element_text(colour="DarkGreen",size=30),
        axis.title.y = element_text(colour = "Red",size = 30),
        axis.text.x = element_text(size=20),
        axis.text.y = element_text(size=20),
        
        legend.title = element_text(size=30),
        legend.text = element_text(size=20),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        plot.title = element_text(colour = "DarkBlue",size=40,family ="Courier" ))
