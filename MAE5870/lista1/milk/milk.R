library(zoo)
library(ggplot2)

milk_df <- read.csv("~/Projects/kayaman/tsa/MAE5870/lista1/milk/milk.csv", header = TRUE)

milk_df$Quarter <- as.yearqtr(milk_df$Quarter, "Q%q %Y")

milk.ts <- zoo(as.matrix(milk_df$Quantity, milk_df$Quarter))

#autoplot(milk.ts, facets = NULL) + scale_x_yearqtr() + geom_point()
par(mfrow=c(3,1))

plot.ts(milk.ts, ylab = "Quadrimestre", main = "Produção Leite SP")
milk.MA = filter(milk.ts, rep(1/5, 5), sides = 2)
lines(milk.MA, col = "red")

Y = milk.ts / milk.MA
plot( Y, ylab="scaled", main="Transformed Milk Data")
acf(na.omit(Y), main="ACF of Transformed Data")
acf(na.omit(Y), type="partial", main="PACF of Transformed Data")


