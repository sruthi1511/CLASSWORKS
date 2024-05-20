#Linear regression
# Read Csv file

stats <- read.csv(file.choose())
head(stats)

# you can factorize a column by using factor()
summary(stats)

# Lets look around first
qplot( x = stats$age , y= stats$charges) 
qplot( x = stats$bmi , y= stats$charges) # A little bit on Education
qplot( x = stats$sex , y= stats$charges) # not so much on gender


results = lm ( stats$charges~stats$age+stats$bmi+stats$sex )
results
summary(results)

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
# polynomial regression
poly <- loess(y~x) 
fit <- predict(poly)
points(x,fit, type="l", col=2)
points(x,lr$coefficients[1] + lr$coefficients[2] * x, type="l", col=4 )

# LOGISTIC REGRESSION

# Check the structure of the data
str(stats)

# Convert categorical variables to factors
stats$sex <- as.factor(stats$sex)
stats$smoker <- as.factor(stats$smoker)
stats$region <- as.factor(stats$region)

# Explore the data
summary(stats)

# Split the data based on the target variable (e.g., children)
has_children <- stats[stats$children > 0, ]
no_children <- stats[stats$children == 0, ]

# Visualize distributions for those with children
qplot(x = age, data = has_children)
qplot(x = bmi, data = has_children)
qplot(x = smoker, data = has_children)

# Visualize distributions for those without children
qplot(x = age, data = no_children)
qplot(x = bmi, data = no_children)
qplot(x = smoker, data = no_children)

# Fit the initial logistic regression model
stats_logistic1 <- glm(children > 0 ~ age + sex + bmi + smoker + region,
                       data = stats, family = binomial(link = "logit"))

summary(stats_logistic1)

# Based on the summary, eliminate insignificant variables
stats_logistic2 <- glm(children > 0 ~ age + bmi + smoker + region,
                       data = stats, family = binomial(link = "logit"))

summary(stats_logistic2)



