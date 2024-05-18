#Linear regression
# Read Csv file

stats <- read.csv(file.choose())
head(stats)

# you can factorize a column by using factor()
summary(stats)

# Lets look around first
qplot( x = stats$phd , y= stats$salary) 
qplot( x = stats$service , y= stats$salary) # A little bit on Education
qplot( x = stats$sex , y= stats$salary) # not so much on gender


results = lm ( stats$salary~stats$phd+stats$service+stats$sex )
results
summary(results)

#Accepting the Null Hypothesis: Removing Gender

head(stats) # 5 variables
# Lets look around first
qplot( x = stats$phd , y= stats$salary) 
qplot( x = stats$service , y= stats$salary) # A little bit on Education
qplot( x = stats$sex , y= stats$salary) # not so much on gender


results2 = lm ( stats$salary~stats$phd+stats$service)
results2
summary(results2)

# Generate a linearly relation
x <- runif(75,0,10) # 75 random numbers of uniform distribution
x <- sort(x)
y <- 20 + 10*x + rnorm(75,0,10) # y= 20+10x and a bit of variety

# see it!
plot(x,y)

# Now lets do the regression
lr <- lm(y~x)
lr # print out the deducted equation

# draw the linear regression line
points( x, lr$coefficients[1] + lr$coefficients[2] * x, type="l", col=4 )


x <- runif(75,0,10) # 75 random numbers of uniform distribution
x<- sort(x)
y <- 200 + x^3 - 10 * x^2 + x + rnorm(75,0,20)

plot(x,y)


lr <- lm(y~x)
lr


points(x,lr$coefficients[1] + lr$coefficients[2] * x, type="l", col=4 )


x <- runif(75,0,10) # 75 random numbers of uniform distribution
x<- sort(x)
y <- 200 + x^3 - 10 * x^2 + x + rnorm(75,0,20)

plot(x,y)

lr <- lm(y~x)
lr

poly <- loess(y~x) # Polynomial regression
fit <- predict(poly)
points(x,fit, type="l", col=2)
points(x,lr$coefficients[1] + lr$coefficients[2] * x, type="l", col=4 )



