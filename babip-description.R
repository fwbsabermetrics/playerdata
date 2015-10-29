# Set your working folder
setwd("~/<path>/playerdata-master")

# Read in the data
bat <- read.csv('batting.csv')

# What is in your data?
head(bat)

# Get BABIP stats
babip <- bat$BABIP

# Histogram of BABIP
hist(babip)

# Summary of BABIP
summary(babip)
mean(babip)
var(babip)
sd(babip)

# Get some Cubs hitters
cubs <- which(bat$Name %in% c("Anthony Rizzo", "Kris Bryant", "Dexter Fowler", "Addison Russell", "Chris Coghlan", "Kyle Schwarber", "Starlin Castro"))

cubsnames <- mapply(toString, bat[cubs,]$Name)

cubsbabip <- babip[cubs]

# How good are these hitters
z.cubsbabip <- (cubsbabip - mean(babip))/sd(babip)

cbind(cubsnames, round(z.cubsbabip, digits=3), cubsbabip)

cbind(name=cubsnames, zbabip=round(z.cubsbabip, digits=3), babip=cubsbabip)

# Mean of Cubs BABIP
mean(bat[bat$Team=="Cubs",]$BABIP)

# How would you calculate the mean and standard deviation of the AL and NL?
mean(bat[bat$League=='NL',]$BABIP)
