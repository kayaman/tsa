library(gdata)
library(zoo)
library(ggplot2) 

milk_df <- read.xls("/Users/kayaman/Projects/kayaman/tsa/Leite.xlsx", sheet = 3, header = TRUE)

milk_df["Quarter"] <- apply(milk_df, MARGIN = 1, FUN = function(milk_df) paste(paste("Q", as.character(milk_df["Trimestre"]), sep = ""), as.character(milk_df["Ano"]), sep = " "))

milk_train <- subset(milk_df, Ano < 2018)
milk_validation <- subset(milk_df, Ano == 2018)

z <- zoo(as.matrix(milk_df$LeiteIndSP), as.yearqtr(milk_df$Quarter, "Q%q %Y"))

autoplot(z, facets = NULL) + scale_x_yearqtr() + geom_point()   


