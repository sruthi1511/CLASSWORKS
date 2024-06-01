#ASSIGNMENT 6 CLUSTERING
#k-means clustering 

all <- read.csv(file.choose()) 
head(all)
qplot(data=all, x=Radio, y=Newspaper) # kind of Obvious!!!
#convert to a matrix as clustering works better on a matrix
mat <- cbind( all$Radio, all$Newspaper)
head(mat)
kmeans(mat,centers=3) # All that output!!!
# lets draw it
km = kmeans(mat,centers=3)$cluster # vector of cluster belonging
all$cl <- factor( km)
head(all)
summary(all)
qplot(data=all, x=Radio, y=Newspaper, color=cl)


head(all)
qplot(data=all, y=Radio) # All over the place!!
kmeans(all$Radio,centers=3)# divide into 3 groups
# lets draw it
km = kmeans(all$Radio,centers=3)$cluster # vector of cluster belonging
all$cl <- factor( km)
qplot(data=all, y=Radio, color=cl)
qplot(data=all, y=Newspaper) # All over the place!!
kmeans(all$Newspaper,centers=3) # divide into 3 groups 

# lets draw it
km = kmeans(all$Newspaper,centers=3)$cluster # vector of cluster belonging
all$cl <- factor( km)
qplot(data=all, y=Newspaper, color=cl)

head(all)
qplot(data=all, y=TV)
qplot(data=all, y=Radio)
qplot(data=all, y=Newspaper)
mat <- cbind(all$TV, all$Radio, all$Newspaper)
head(mat)
kmeans(mat,centers=3) # divide into 3 groups

# lets draw it
km = kmeans(mat,centers=3)$cluster # vector of cluster belonging
all$cl <- factor( km)

# A bit hard to draw 4 columns
qplot(data=all, y=TV, color=cl)
qplot(data=all, y=Radio, color=cl)
qplot(data=all, y=Newspaper, color=cl)
qplot(data=all, x=Newspaper,y=Radio, color=cl)
qplot(data=all, x=Newspaper,y=TV, color=cl)
qplot(data=all, x=TV, y=Newspaper, color=cl)

head(all)
library("plot3D")
scatter3D(all$TV,all$Newspaper,all$Radio)
mat <- cbind(all$TV,all$Newspaper,all$Radio, col=NULL)
head(mat)
wss <- rep(0,15) # remember this!
wss
for (k in 1:15)
  wss[k] <- sum( kmeans(mat,centers=k, nstart=50)$withinss)
wss
plot(wss, type="b") # see the ELBOW at index = 3, so 3 clusters is best
kmeans(mat,centers=3) # divide into 3 groups
# lets draw it
km = kmeans(mat,centers=3)$cluster # vector of cluster belonging
all$cl <- km
scatter3D(all$TV,all$Newspaper,all$Radio, colvar=all$cl)