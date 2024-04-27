#visualization of scatterplot of X and Y

First <- rnorm(50)
Second <- First + rnorm(50, mean=0, sd=0.4)
data <- as.data.frame(cbind(First,Second)) 

# making a data frame by binding
# text results 
summary(data)

library(ggplot2)

# visualization
ggplot( data, aes(x=First,y=Second)) + geom_point(size=2)

#ANSCOMBE QUARTET
data("anscombe")
anscombe
# generate levels to indicate group number
levels <- gl(4, nrow(anscombe))

mydata <- with(anscombe,data.frame(x=c(x1,x2,x3,x4), y=c(y1,y2,y3,y4),
                                   mygroup=levels))

mydata

theme_set(theme_bw())

ggplot(mydata, aes(x,y)) + geom_point(size=4) +
  geom_smooth(method="lm",fill=NA, fullrange=TRUE) +facet_wrap(~mygroup)

# MISSING DATA IN R

x <- c( 1,2,3,NA,5)
x
is.na(x)
mean(x) # NA
mean(x, na.rm=TRUE) #2.75

DF <- data.frame( x= c(12,9,23), y=c(10,20,NA))
DF
DF1 <- na.exclude(DF)
DF1
max(DF) #NA
max(DF, na.rm=TRUE) #23
max(DF1) #20

# VISUALIZATION OF DOTCHART AND BARPLOT

data(mtcars)

dotchart(mtcars$mpg, labels=row.names(mtcars), 
         cex=0.6, main="Miles perGallons of Car models", xlab="mpg")

barplot(table(mtcars$cyl),
        main="Dist of Car Cylinder Count", xlab="Number ofcylinders")

#VISUALIZATION OF STEM AND LEAF VS. HISTOGRAM
x <- c( 12, 13, 21, 27, 33, 34, 35, 37, 46, 51, 51, 57)
x
stem(x)
hist(x)

#VISUALIZATION OF HISTOGRAM AND DENSITYPLOT

income <- rlnorm(1000, meanlog = 4, sdlog = 0.7)
summary(income)
hist(income, breaks = 500, xlab = "Income", main = "Histogram of Income")
rug(income)
plot(density(log10(income), adjust = 0.5), main = "Log10 Scale Distribution")
rug(log10(income))

#VISUALIZATION OF NICER DENSITYPLOT

library("ggplot2")
data(diamonds)#only keep the premium and ideal cuts of diamonds
nicediamonds <- diamonds [diamonds$cut=="Premium" | 
                            diamonds$cut=="Ideal",]
summary(nicediamonds$cut)
ggplot( nicediamonds, aes(x=price, fill=cut)) + 
  geom_density(alpha=0.3,color=NA)
ggplot( nicediamonds, aes(x=log10(price), fill=cut)) + 
  geom_density(alpha=0.3,color=NA)

#VISUALIZING THREE VARIABLES

data("mtcars")
cars <- mtcars[order(mtcars$mpg),]
cars$cyl <- factor(cars$cyl)
cars$color[cars$cyl==4] <- "Red"
cars$color[cars$cyl==6] <- "Blue"
cars$color[cars$cyl==8] <- "Green"
dotchart(cars$mpg, labels=row.names(cars), cex=.4, groups=cars$cyl, 
         main="Miles per Gallon", xlab="Milesoer Gallon", 
         color= cars$color, gcolor="Black")

#The matrix function:
A<- matrix(1:10, nrow=5)
A

B <- matrix( 21:40, nrow=2)
B

C <- matrix(1:100, 20)
C

D <- matrix(0,4,4)
D

E <- matrix(0,10)
E

F <- matrix(c(4,5,6,2,3,4,12,34,45,10,55,32),4,3)
F

#Matrix Creation (by “Snaking”)

Data <- 1:20
A <-matrix(Data, 4,5) #snake down
A

B <-matrix(Data,4,5,byrow=TRUE) #snake right
B

C<-A+B
C

#Matrix functions
A <- matrix(1:10, nrow=5)
A
nrow(A)
ncol(A)
dim(A)
typeof(A)
B <- t(A)
B

#Matrix access
A <- matrix(1:10, nrow=5)
A
A[1,1]
A[,1]
A[1,]
A[-2,]
A[,-2]
A[-2,-2]

#Named Vector
Charlie <- 7:11
Charlie
names(Charlie) <- c("a", "b","c","d","e")
Charlie
Charlie[4]
Charlie["d"]
names(Charlie)

#clear names
names(Charlie) <- NULL
Charlie

#Named matrix
temp <- rep(c("a", "b","c"),each=3)
temp
Bravo <- matrix(temp,3,3)
Bravo
rownames(Bravo) <- c("Tom", "Dick", "Harry")
Bravo
colnames(Bravo) <- c("Alice", "Jane", "Mary")
Bravo

Bravo[2,3] <-0
Bravo
Bravo["Tom", "Mary"] <- 0
Bravo

rownames(Bravo)
colnames(Bravo)

# Big Basketball project

#Simple math
Games
rownames(Games)
colnames(Games)
Games["LeBronJames", "2012"]
FieldGoals

# Approx number of goals per game rounded to 2 decimal points
round( FieldGoals / Games, 2)
round (MinutesPlayed / Games)
round(Salary/Games)
round(Salary/FieldGoals)

#Matplot to plot matrices
# plots COLUMNS against each other
?matplot
FieldGoals
t(FieldGoals) # transpose the matrix
matplot(FieldGoals) # UGLY ,each rows comes together
matplot(t(FieldGoals)) # ugly too

# Let's check out the parameters, but ggplot is much better
matplot(t(FieldGoals / Games), type = "b", pch = 15:18, col = c(1:4, 6))
legend("bottomleft", inset = 0.01, legend = Players, pch = 15:18, 
       col = c(1:4, 6), horiz = FALSE)
matplot(t(FieldGoals / FieldGoalAttempts), type = "b", 
        pch = 15:18, col = c(1:4, 6))
legend("bottomleft", inset = 0.01, legend = Players, 
       pch = 15:18, col = c(1:4, 6), horiz = FALSE)

# Dwight Howard has the best performance!!!

#Subsetting in a vector
x <-c("a","b","c","d","e")
x
x[c(1,4)] #subset
x[1] #subset

#Subsetting in a matrix
Games
Games[1:3, 6:10] # subset of a matrix is a matrix
Games[c(1,10), ] # first and last row, all columns
Games[ , c("2008","2009")] # all players columns 2008 and 2009

Games[1,] # one row, a vector!
Games[1,5] # A vector, too !
is.matrix(Games[1,])
is.vector(Games[1,])

# R automatically guessed you wanted a vector, you can stop it:
Games[1, , drop=F] # now it remains as a matrix not vector
is.matrix(Games[1, , drop=F])
is.vector(Games[1, , drop=F])
Games[1,5, drop=F]

# Matplotting a subset
matplot(t(MinutesPlayed), type = "b", pch = 15:18, col = c(1:4, 6))
legend("bottomleft", inset = 0.01, 
       legend = Players, pch = 15:18, col = c(1:4, 6), horiz = FALSE)

Data <- MinutesPlayed[1:3, ]
matplot(t(Data), type = "b", pch = 15:18, col = c(1:3, 6))
legend("bottomleft", inset = 0.01, 
       legend = Players[1:3], pch = 15:18, col = c(1:3, 6), horiz = FALSE)

# One player
Data <- MinutesPlayed[1, , drop = FALSE]  # Ensure to keep the matrix structure
matplot(t(Data), type = "b", pch = 15:18, col = c(1, 6))
legend("bottomleft", inset = 0.01,
       legend = Players[1], pch = 15:18, col = c(1, 6), horiz = FALSE)


# Writing your own function!
myplot <- function(rows) {
  Data <- MinutesPlayed[rows, , drop = FALSE]
  matplot(t(Data), type = "b", pch = 15:18, col = c(1:4, 6))
  legend("bottomleft", inset = 0.01, 
         legend = Players[rows], pch = 15:18, col = c(1:4, 6), horiz = FALSE)
}

myplot(3:5)
myplot(7)
myplot(c(1, 7))

myplot2 <- function(mat, rows = 1:10) { # default is 1:10
  Data <- mat[rows, , drop = FALSE]
  matplot(t(Data), type = "b", pch = 15:18, col = c(1:4, 6))
  legend("bottomleft", inset = 0.01, 
         legend = Players[rows], pch = 15:18, col = c(1:4, 6), horiz = FALSE)
}

# Example usages of myplot2 with different matrices
myplot2(Points, 1:10)
myplot2(Salary, 1:3)
myplot2(Salary)
myplot2(MinutesPlayed/Games, 3:5)


#Data Visualization
#salary

myplot2(Salary)
myplot2(Salary/Games)
myplot2(Salary/FieldGoals)

# in-game metrics
myplot2(MinutesPlayed)
myplot2(Points)

# in-game metrics Normalized ( to avoid injury skewed results)
# Check out Dwight Howard!
myplot2(FieldGoals/Games)
myplot2(FieldGoals/FieldGoalAttempts)
myplot2(FieldGoalAttempts/Games) #keep an eye on Dwight howard
myplot2(Points/Games) #keep an eye on Dwight howard# interesting observation
myplot2(MinutesPlayed/Games) # less and less!
myplot2(Games) # what happened in 2011









