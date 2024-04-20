#ASSIGNMENT 1

#program to get the average of 3numbers: 7, 12, and 5

A<-c(7,12,5)
B <- mean(A)
B

# program to print out “Welcome to R,<your first name>”

greet <- "Welcome to R ,"
Firstname <- "keerthi"
message <- paste(greet,Firstname)
message

# Let x be 7, y be 12 and z be 4, print outwhether x is bigger than y and whether x isbigger than z

x <- 7
y <- 12
z <- 4

# Checking whether x is greater than y
if (x > y) {
  print("x is bigger than y")
} else {
  print("x is not bigger than y")
}

if (x > z) {
  print("x is bigger than z")
} else {
  print("x is not bigger than z")
}

