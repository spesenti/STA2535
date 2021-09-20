
setwd("~/STA2535")

# Import dataset: Death_Probability_Canada_2018
mort_2018 <- read.csv("data/Mortality-Canada-2018.csv")
# let's have a look at the dataset
head(mort_2018)

plot(mort_2018[,"Age.group"], mort_2018[, "VALUE"], pch = 16, col = "green",
     xlab = "age", ylab = "mortality", main = "Canadian Mortality in 2018")

# plotting ages 1:60 
plot(mort_2018[1:60,"Age.group"], mort_2018[1:60, "VALUE"], pch = 16, col = "green",
     xlab = "age", ylab = "mortality", main = "Canadian Mortality in 2018")

# log-scale is much more informative
plot(mort_2018[,"Age.group"], log(mort_2018[, "VALUE"]), pch = 16, col = "green",
     xlab = "age", ylab = "mortality - log-scale", main = "Canadian Mortality in 2018")

# How does this compare to the mortality in 2008?
# Import dataset: Death_Probability_Canada_2018
mort_2008 <- read.csv("data/Mortality-Canada-2008.csv")

plot(mort_2018[,"Age.group"], log(mort_2018[, "VALUE"]), pch = 16, col = "green", cex = 0.5,
     xlab = "age", ylab = "mortality - log-scale", main = "Canadian Mortality in 2018")
points(mort_2008[,"Age.group"], log(mort_2008[, "VALUE"]), pch = 16, col = "blue", cex = 0.5)
legend("topleft", legend = c("2018", "2008"), pch = 16, col = c("green", "blue"))


mort_1998 <- read.csv("data/Mortality-Canada-1998.csv")
# plotting all three
plot(mort_2018[,"Age.group"], log(mort_2018[, "VALUE"]), pch = 16, cex = 0.5, col = "green",
     xlab = "age", ylab = "mortality - log-scale", main = "Canadian Mortality in 2018")
points(mort_2008[,"Age.group"], log(mort_2008[, "VALUE"]), pch = 16, col = "blue", cex = 0.5, )
points(mort_1998[,"Age.group"], log(mort_1998[, "VALUE"]), pch = 16, col = "red", cex = 0.5) 
legend("topleft", legend = c("2018", "2008", "1998"), pch = 16, col = c("green", "blue", "red"))



# let's look what happened here...
plot(mort_2018[2:45,"Age.group"], mort_2018[2:45, "VALUE"], pch = 16, col = "green",
    xlab = "age", ylab = "mortality", main = "Canadian Mortality in 2018")
points(mort_2008[2:45,"Age.group"], mort_2008[2:45, "VALUE"], pch = 16, col = "blue")
points(mort_1998[2:45,"Age.group"], mort_1998[2:45, "VALUE"], pch = 16, col = "red")
legend("topleft", legend = c("2018", "2008", "1998"), pch = 16, col = c("green", "blue", "red"))



