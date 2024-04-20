x <-rnorm(5)
x

N <-100000
a <-rnorm(N)
b <- rnorm(N)

#Vectorized approach
c <- a * b
c

X <- rnorm(5)
X 
plot(X)
hist(X)

X<- rnorm( 5, 10, 1)
X
plot(X)
hist(X)

X <- rnorm (5, 10)
X
plot(X)
hist(X)

X <- rnorm(5, mean=10, sd = 1)
X
plot(X)
hist(X)

X <- rnorm(5, sd=1, mean=10)
X
plot(X)
hist(X)

X <- rnorm(5, sd=1)
X
plot(X)
hist(X)

X <- rnorm(3)
X
plot(X)
hist(X)

X <- rnorm( 3, 9, 1)
X
plot(X)
hist(X)

X <- rnorm (3, 9)
X
plot(X)
hist(X)

X <- rnorm(3, mean=9, sd = 1)
X
plot(X)
hist(X)

X <- rnorm(3, sd=1, mean=9)
X
plot(X)
hist(X)

x <-rnorm(10)
plot(x)
hist(x)

x <-rnorm(80000)
#plot(x)
#hist(x)
head(x)
tail(x)
range(x)
summary(x)
boxplot(x,horizontal= TRUE)

X <- rnorm(6)
X
