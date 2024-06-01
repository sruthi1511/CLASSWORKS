---
title: "ADVERTISING DATASET K MEANS CLUSTERING"
date: "MAY 31 2024"
output: html_document
---

### CLUSTERING :

-   Clustering is an unsupervised machine learning technique that groups a set of data points into clusters, such that data points within the same cluster are more similar to each other than to those in other clusters.

-   It is a crucial technique in data analysis, often used to identify patterns or structures in data. Some common clustering algorithms and concepts include K means Clustering

**K-MEANS CLUSTERING:**

-   K-Means Clustering is the most popular and widely used clustering algorithms. In K-Means Clustering algorithm works as follows:

-   The algorithm starts by selecting randomly K data points centroids of the K clusters.

-   Each data point is assigned to the cluster with the centroids based on a distance metric (usually Euclidean distance).

-   After all data points have been assigned, the centroids of the clusters are again calculated by taking the mean of all data points in each cluster.

-   This Steps are repeated until the centroids no longer change , or a maximum number of iterations is reached.

```         
## Load Data
```

# Load necessary libraries

library(ggplot2) library(plot3D)

# Load the data

all \<- read.csv(file.choose()) head(all)

```         
## Scatter Plot of Radio vs Newspaper
```

qplot(data=all, x=Radio, y=Newspaper)

```         
## Convert to Matrix and Perform Clustering

# Convert to a matrix for clustering
mat <- cbind(all$Radio, all$Newspaper)
head(mat)

# Perform k-means clustering with 3 centers
kmeans_result <- kmeans(mat, centers=3)
kmeans_result

# Assign cluster results to the data frame
all$cl <- factor(kmeans_result$cluster)
head(all)
summary(all)
```

# Plot Clustering Results

```         
qplot(data=all, x=Radio, y=Newspaper, color=cl)
```

## Clustering on Radio Only

```         
qplot(data=all, y=Radio)
kmeans_result_radio <- kmeans(all$Radio, centers=3)
all$cl <- factor(kmeans_result_radio$cluster)
qplot(data=all, y=Radio, color=cl)
```

## Clustering on Newspaper Only

```         
qplot(data=all, y=Newspaper)
kmeans_result_newspaper <- kmeans(all$Newspaper, centers=3)
all$cl <- factor(kmeans_result_newspaper$cluster)
qplot(data=all, y=Newspaper, color=cl)
```

## Clustering on TV, Radio, and Newspaper

```         
qplot(data=all, y=TV)
qplot(data=all, y=Radio)
qplot(data=all, y=Newspaper)

# Convert to a matrix for clustering
mat <- cbind(all$TV, all$Radio, all$Newspaper)
head(mat)

# Perform k-means clustering with 3 centers
kmeans_result_all <- kmeans(mat, centers=3)
kmeans_result_all

# Assign cluster results to the data frame
all$cl <- factor(kmeans_result_all$cluster)
```

## Plot Clustering Results for TV, Radio, and Newspaper

```         
qplot(data=all, y=TV, color=cl)
qplot(data=all, y=Radio, color=cl)
qplot(data=all, y=Newspaper, color=cl)
qplot(data=all, x=Newspaper, y=Radio, color=cl)
qplot(data=all, x=Newspaper, y=TV, color=cl)
qplot(data=all, x=TV, y=Newspaper, color=cl)
```

## 3D Scatter Plot

```         
scatter3D(all$TV, all$Newspaper, all$Radio, colvar=all$cl)
```

## Determine Optimal Number of Clusters

```         
# Calculate within-cluster sum of squares for different numbers of clusters
wss <- rep(0, 15)
for (k in 1:15) {
  wss[k] <- sum(kmeans(mat, centers=k, nstart=50)$withinss)
}
wss

# Plot the within-cluster sum of squares
plot(wss, type="b", xlab="Number of Clusters", ylab="Within groups sum of squares")
```

## Final Clustering with 3 Clusters

```         
# Perform k-means clustering with 3 centers
final_kmeans_result <- kmeans(mat, centers=3)
all$cl <- final_kmeans_result$cluster

# 3D scatter plot with final clusters
scatter3D(all$TV, all$Newspaper, all$Radio, colvar=all$cl)
```

\`\`\`
