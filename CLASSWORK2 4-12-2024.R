# Selection
x <- 0
count <- 0

if( x>= -1 & x <=1) {
   count <- count+1
} else {
  count <- count-1
}
count

# Write a program to display the square roots ofall numbers from 1 to 20
for(x in 1:20) {
    print(sqrt(x))
}

# Creation of VECTORS

v1 <- c( 2, 5, 7, 1, 4)
v1
typeof(v1)

v2 <- c( "I", "am", "Sam")
v2
typeof(v2)

v3 <- c( T,F,T )
v2
typeof(v2)

# How many items in X ? In Y ?
X <- c(3,4,5)
Y <- c(X,X,X,X)
Y


V <- 1:10
S <- -5:30
T <- 10:1
Mix <- c( 3:6, 24, 0:4, 31, 9:7)

# Creating a vector using the seqfunction
A <- 1:10
A <- seq(1,10)
A

B <- seq(1,10, by=2)
C <- seq(5, -5, by=-2)
B
C

D <- seq(1,10, length=20)
D

E <- seq(0,1, length=15)
E
#Creating a vector using rep function
A <- rep("Hello", 5)
A

B <- rep(A,2)
B

D1 <- rep(c("A","B","C"), 3)
D1

D2 <- rep(c("A","B","C"), each=3)
D2

D3 <- rep(c("A","B","C"), c(2,1,3))
D3    
# Mixed mode to single mode
T <- c("Hello",3, 67L, 6.8)
typeof(T)

X <- c(3,5,8)
typeof(X)
length(X)
#Displaying partial vectors
w <- c ("a", "b", "c", "d","e")
w[1]
w[2]
w[-1] # all except number 1
w[-3]
w[c(1,3,5)] #get specific items
w[c(-2,-4)] #same thing
w[c(-3:-5)] # remove range 3 to 5
w[1:3]
#Sorting a vector
A <- c(5,-2,51,42,-76,42)
B <- sort(A)
A
B

X <- c( 1, 2, 3)
Y <- c( 4, 5 ,6 )
Z <- X + Y
X
Y
Z

X <- c( 1, 2, 3)
Y <- c( 4, 5 , 6, 7, 8, 9 )
Z <- X + Y
X
Y
Z
# MATH FUNCTIONS
X <- c( 34,56,22,11,65,45)
Y <- mean(X)
Y

Z <- min(X)
Z

W <- max(X)
W

S <- sum(X)
S

V <- prod(X)
V

Tax <- c(32,56,44,76,89,24)
for (i in 1:6)
  if (Tax[i] < 50)
    print(i)

for (i in Tax)
  if (i <50)
    print(i)

# Classwork 2
# temperature measurement in degrees Fahrenheit F to Celsius
C <- (45-32)*5/9
C
C <- (77-32)*5/9
C
C <- (20-32)*5/9
C
C <- (19-32)*5/9
C
C <- (101-32)*5/9
C
C <- (120-32)*5/9
C
C <- (212-32)*5/9
C

X <- c(7.22,25,6.67,-7.22,38.33,48.89,100)
Y <- max(X)
Y

Z <- min(X)
Z

A <- mean(X)
A