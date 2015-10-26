## quiz 3 ##

# 1 # mean by subsetting

library(datasets)
data(iris)

head(iris)
tail(iris)
summary(iris)
colnames(iris)
cat(colnames(iris), file = "iris", sep = "\n")

class(iris)

# 1. način - klasični subsetting

mean(iris$Sepal.Length[iris$Species == "virginica"])

# 2. način - dplyr filter 

library(dplyr)
virginica.df <- filter(iris, Species == "virginica")
mean(virginica.df$Sepal.Length)

# 3. način - tapply

tapply(iris$Sepal.Length, iris$Species, mean)



# 2 # mean by apply

# kad bi sve varijable bile numeričke, radio bi i apply(iris, 2, mean), ali nisu:
apply(iris[,1:4], 2, mean)


# 3 # mean by apply - mtcars

data(mtcars)

rez <- apply(mtcars, 2, mean)
print(rez)

sapply(mtcars, mean)
sapply(mtcars, class)

?sapply

tapply(mtcars$mpg, mtcars$cyl, mean)
summary(mtcars)
unique(mtcars$cyl)

hp 4 cyl vs hp 8 cyl
hp.cyl <- tapply(mtcars$hp, mtcars$cyl, mean)
class(hp.cyl)
hp.cyl[[3]] - hp.cyl[[1]]
