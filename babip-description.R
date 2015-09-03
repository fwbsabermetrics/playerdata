# Set your working folder
setwd("~/<path>/playerdata")

# Read in the data
players <- read.csv('players2015_9-3.csv')

# What is in your data?
head(players)

# Get BABIP stats
babip <- players$BABIP

# Histogram of BABIP
hist(babip)

# Summary of BABIP
summary(babip)
mean(babip)
var(babip)
sd(babip)

# Get some Cubs hitters
cubs <- which(players$Name %in% c("Anthony Rizzo", "Kris Bryant", "Dexter Fowler", "Addison Russell", "Chris Coghlan", "Kyle Schwarber", "Starlin Castro"))

cubsnames <- mapply(toString, players[cubs,]$Name)

cubsbabip <- babip[cubs]

# How good are these hitters
cubsbabipdev <- (cubsbabip - mean(babip))/sd(babip)

cbind(cubsnames, round(cubsbabipdev, digits=3), cubsbabip)

