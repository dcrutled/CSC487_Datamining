#(1)
getwd()
setwd("C:/Users/Cole/OneDrive/School/CSC487 Datamining/data_files")

su = read.delim("Su_raw_matrix.txt") #reading into variable "su"
mean(su$Liver_2.CEL)                 #getting mean from Liver_2.CEL column with mean() function
sd(su$Liver_2.CEL)                   #getting standard deviation for Liver_2.CEL with sd() function
colMeans(su)                         #means for all columns
colSums(su)                          #sums for all columns

#(2)
library('ggplot2')
set_1 = data.frame(col_a = rnorm(10000, 0, 0.2))
ggplot(set_1, aes(x = col_a)) + geom_histogram(col = 'black', fill = 'orange', bins = 30)

set_2 = data.frame(col_b = rnorm(10000, 0, 0.5))
ggplot(set_2, aes(x = col_b)) + geom_histogram(col = 'black', fill = 'purple', bins = 30) 

#The peaks for each data set lies in different places, the standard deviation for each was set to different figures

#(3)

#(a)
dat <- data.frame(cond = factor(rep(c("A","B"), each=200)),
rating = c(rnorm(200),rnorm(200, mean=.8)))

#(b)
# Overlaid histograms
ggplot(dat, aes(x=rating, fill=cond)) +
geom_histogram(binwidth=.5, alpha=.5, position="identity")

#(c)
# Interleaved histograms
ggplot(dat, aes(x=rating, fill=cond)) + geom_histogram(binwidth=.5, position="dodge")

#(d)
# Density plots
ggplot(dat, aes(x=rating, colour=cond)) + geom_density()

#(e)
# Density plots with semitransparent fill
ggplot(dat, aes(x=rating, fill=cond)) + geom_density(alpha=.3)

#(f)
diabetes = read.csv("diabetes_train.csv")

ggplot(diabetes, aes(x=mass, fill=class)) +
geom_histogram(binwidth=.5, alpha=.5, position="identity")

ggplot(diabetes, aes(x=mass, fill=class)) + geom_histogram(binwidth=.5, position="dodge")

ggplot(diabetes, aes(x=mass, colour=class)) + geom_density()

ggplot(diabetes, aes(x=mass, fill=class)) + geom_density(alpha=.3)

#(4)
library('tidyr')
library('dplyr')
passengers = read.csv("Titanic.csv")

#(a)
passengers %>% drop_na() %>% summary()

#(b)
passengers %>% filter(Sex == "male")           #this line filters out all of the male passengers

#(c)
passengers %>% arrange(desc(Fare))             #this line arranges all of the passenegers based on the fare they paid

#(d)
passengers %>% mutate(FamSize = Parch + SibSp) #this line adds an extra column to denote family size

#(e)
passengers %>% group_by(Sex) %>% summarise(meanFare = mean(Fare), numSurv = sum(Survived)) #this line finds the mean fare based on sex and displays how many survived

#(5)

quantile(diabetes$skin, probs = c(0.1, 0.3, 0.5, 0.6))
