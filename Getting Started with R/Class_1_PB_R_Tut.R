#### Introduction to R ######
###Why to Learn?#####
#Language of bioinformaticians and statisticians
#More than thousands of packages for biological sciences and 
##statistics related work





##What are those genes leading to the discriminating 
#the different stages of cancer?

##What are those genes discriminating 
# cancer from healthy?









###What to Learn??###


###How to Learn?#####
##Innumerable online freely available tutorials
##Textbooks
#swirl <- package in R to teach R


######Topics
#1) Variable assignments
#2) Operators 
#3) Vectors and Lists
#4) Data Frames



#1) Variables

a <- 10
b <- 20
c <- a+b #Wrong naming convention
sum_a_b = a+b #Good naming convention

pb <- 'Practical Bioinformatics' #Initiate strings or character



#2) Operators
#Add
2+2
#Subtract
2-2
#Multiply
2*2
#Divide
2/2
#Quotients
13 %/% 5

##Remainder
13%%3

##Exponential
exp(1)
exp(-Inf)

##Logarithm
log2(12)
log10(10)

###Vectors to store more than a item
names <- c('Anand','Manas','Lavanya','Shivangi')
num <- c(-1,-2,-3,-4,1,2,3,4)
num <- -4:4
num_sq <- num**2







###Seq, Rep and paste function
seq(1,100,2)
i=rep('I',100)
love=rep('LOVE',100)
dogs=rep('DOGS',100)
paste(i,love,dogs)


####List 
names <- c('Alok','Manas','Lavanya','Shivangi')
math_bio <- c(8,7,9,9)
sys_bio <- c(6,10,8,10)
net_bio <- c(5,9,8,9)
school <- c('DU','JNU','IP','CUH')
student_rec=list(Names=names,Math_Bio=math_bio,Net_Bio=net_bio)
student_rec_df=as.data.frame(student_rec)




list()

###Matrix creation
set.seed(0)
num_1=rnorm(5,0,1)
num_2=rnorm(5,1,1)
num_3=rnorm(5,2,1)
mat=rbind(num_1,num_2,num_3)
rownames(mat) = paste('Row',1:3)
colnames(mat) = paste('Col',1:5)

####Getting working directory
getwd()
##Getting working directory
setwd()
###Help 
?
help()
###Installing packages
install.packages('ggplot2')
install.packages('GEOquery')
install.packages('dplyr')
##Installing multiple packages 
install.packages(c('ggplot2','GEOquery','dplyr'))

###Installing repositories

###Home work 
#1) Download any microarray data of your interest.
#2) Perform exploratory analysis upon this data.

##Reading a file
#brca_fasta=read.delim("sequence.fasta", header = FALSE)


