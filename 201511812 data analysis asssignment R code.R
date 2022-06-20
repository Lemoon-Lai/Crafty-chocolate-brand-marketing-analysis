seg.df<-read.csv("1_demographics.csv", stringsAsFactors = TRUE)
seg.df.sc <- seg.df
seg.df.sc[, c(1,3,4)] <- scale(seg.df[, c(1,3,4)])
# we only need to standardize continuous variables.
head(seg.df.sc)
summary(seg.df.sc, digits = 2)




seg.df<-read.csv("1_demographics.csv", stringsAsFactors = TRUE)
library(mclust)
seg.mc <- Mclust(seg.df) 
summary(seg.mc)
seg.mc4 <- Mclust(seg.df.sc, G =4) #specifying the number of clusters)
summary(seg.mc4)
BIC(seg.mc, seg.mc4)
aggregate(seg.df, list(seg.mc$classification), mean)
library(cluster)
clusplot(seg.df, seg.mc$classification, color = TRUE, shade = TRUE,
         labels = 4, lines = 0, main = "Model-based cluster plot")



brand.ratings <- read.csv("2_chocolate_rating.csv", stringsAsFactors = TRUE)
head(brand.ratings)
summary(brand.ratings)

brand.sc <- brand.ratings
brand.sc[,6:14] <- scale (brand.ratings[,6:14])
summary(brand.sc)
cor(brand.sc[,6:14])
library(corrplot)
corrplot(cor(brand.sc[,6:14]))
corrplot(cor(brand.sc[,6:14]), order = "hclust")

brand.mean <- aggregate(. ~ brand, data=brand.sc, mean)
brand.mean
rownames(brand.mean) <- brand.mean[, 1]
brand.mean <- brand.mean [, -1]
brand.mean

brand.mean <- brand.mean [, -1:-4]
brand.mean
brand.mean <- brand.mean [, -3,-5]
brand.mean
brand.mean <- brand.mean [, -4,-6]
brand.mean
brand.mean <- brand.mean [, -8:-11]
brand.mean
brand.mean <- brand.mean [, -7]
brand.mean
brand.mean <- brand.mean [, -5]
brand.mean
library(gplots) #install gplots
heatmap.2(as.matrix(brand.mean),main = "Brand attributes",
          trace = "none", key = FALSE, dend = "none" # key = color key  dend = liner
          #turn off some options
)
brand.pc<- princomp(brand.mean, cor = TRUE)
#we added "cor =TRUE" to use correlation-based one.
summary(brand.pc)
plot(brand.pc,type="l") # scree plot
loadings(brand.pc) # pc loadings
brand.pc$scores # the principal components

biplot(brand.pc, main = "Brand positioning")

library("xtable") # processing of regression output
library("knitr") # used for report compilation and table display
library("ggplot2") # very popular plotting library ggplot2
library("mlogit") # multinomial logit






library("caret") # ConfusionMatrix
cbc.df<-read.csv("5_conjoint.csv", stringsAsFactors = TRUE)
str(cbc.df) # print structure
head(cbc.df)
summary(cbc.df)

xtabs(Choice~Price, data=cbc.df) # calculate the price have been chocice ex: 160 dollar choice by 688 times, cheeper have more choeesen
xtabs(Choice~Choco_Consumption, data=cbc.df) 

## prepare for the data 
cbc.df$Origin <- relevel(cbc.df$Origin, ref = "Venezuela") # relevel= reference level  keep Nexus as the reference level
cbc.df$Energy <- relevel(cbc.df$Energy, ref = "Low") #
cbc.df$Tokens <- relevel(cbc.df$Tokens, ref = "No") #
cbc.df$Sugar <- relevel(cbc.df$Sugar, ref = "High") #
cbc.df$Organic <- relevel(cbc.df$Organic, ref = "No") #

library(dfidx)
cbc.mlogit <- dfidx(cbc.df, choice="Choice",
                    idx=list(c("Choice_id", "Consumer_id"), "Alternative"))  #dfidx     index = list (combine "ChoiceSetId" and "ConsumerId"), "AlternativeIdInSet
head(cbc.mlogit)

##estimate model
library(mlogit)
model<-mlogit(Choice ~ Origin+Energy+Tokens+Sugar+Organic, data=cbc.mlogit) #0 is mean we don't want constent 
library(knitr)
kable(summary(model)$CoefTable) # 顯著 Pr < 0.05   brand ipad is 對消費者有顯著影響 so change the reference model to ipad. # check estimate the higher value mean the most prefer 
# price negitave is right because most customers didn't like high price.


## model fit 
model.constraint <-mlogit(Choice ~ Origin, data = cbc.mlogit)
lrtest(model, model.constraint) # likelihood ratio test, nested models   the value which is close to 0 mean the better model
# the larger loglik mean the model is the better one # ue (Pr(>Chisq)) is smaller than 0.05, if bigger 0.05 means two of the model is simmilar


summary(model)$CoefTable
## predict market share

kable(head(predict(model,cbc.mlogit)))

predicted_alternative <- apply(predict(model,cbc.mlogit),1,which.max) # the max value set the number with 1 
selected_alternative <- cbc.mlogit$Alternative[cbc.mlogit$Choice>0] # the choice which is bigger than one mean it will be choosen to the package

library(caret)
confusionMatrix(table(predicted_alternative,selected_alternative),positive = "1")

-0.005088804 # 1 dollar price will lead to 0.005 decrease in utility
1/0.00508804 #willingness to pay for 1 utility

(coef(model)["Peru"]-coef(model)["Ecuador"]) / (-coef(model)["Price"])





retail.raw <- readLines("6_groceries.dat")
head(retail.raw)
tail(retail.raw)
summary(retail.raw)

retail.list <- strsplit(retail.raw, ",") 
str(retail.list)
names(retail.list) <- paste("Trans", 1:length(retail.list)) 
str(retail.list)
rm(retail.raw)

retail.trans <- as(retail.list, "transactions") 
summary(retail.trans)
rm(retail.list) 



inspect(head(retail.trans,5))
groc.rules <- apriori(retail.trans, parameter = list(supp=0.01, conf=0.3, target="rules")) 

inspect(subset(groc.rules, lift > 3)) # subset = pick up the data 
library(arulesViz)
plot(groc.rules)
library(plotly)


plot(groc.rules, engine = "plotly")
groc.hi <- head(sort(groc.rules, by="lift"), 15 )
inspect(groc.hi)
plot(groc.hi, method="graph")






library(readxl)
library(dplyr)
spending.data <- read.csv("7_advertising.csv")
str(spending.data)
plot(spending.data$radio, spending.data$sales)
cor(spending.data$radio, spending.data$sales)
regression <- lm(sales ~ radio, data = spending.data)
summary(regression)



library(readxl)
library(dplyr)
spending.data <- read.csv("7_advertising.csv")
str(spending.data)
plot(spending.data$tv, spending.data$sales)
cor(spending.data$tv, spending.data$sales)
regression <- lm(sales ~ tv, data = spending.data)
summary(regression)


library(readxl)
library(dplyr)
spending.data <- read.csv("7_advertising.csv")
str(spending.data)
plot(spending.data$newspaper, spending.data$sales)
cor(spending.data$newspaper, spending.data$sales)
regression <- lm(sales ~ newspaper, data = spending.data)
summary(regression)



library(readxl)
library(dplyr)
spending.data <- read.csv("7_advertising.csv")
str(spending.data)
plot(spending.data$social_media, spending.data$sales)
cor(spending.data$social_media, spending.data$sales)
regression <- lm(sales ~ social_media, data = spending.data)
summary(regression)


library(readxl)
library(dplyr)
spending.data <- read.csv("7_advertising.csv")
str(spending.data)
plot(spending.data$magazines, spending.data$sales)
cor(spending.data$magazines, spending.data$sales)
regression <- lm(sales ~ magazines, data = spending.data)
summary(regression)


regression <- lm(log(sales) ~ log(radio+0.01) + log(tv) + log(newspaper) + log(magazines)+ log(social_media)+ log(search_ads),
                 data=spending.data)
summary(regression)





ad.df <- read.csv("8_clickstream.csv", stringsAsFactors = TRUE)
summary(ad.df)
aggregate(ad.df$time_spent_homepage_sec, list(ad.df$condition), mean)

library(lattice)
histogram(~ clicked_like | condition, data = ad.df)
histogram(~ clicked_like | clicked_article + condition + clicked_share, data = ad.df)


table(ad.df$clicked_like, ad.df$condition)
chisq.test(table(ad.df$clicked_like, ad.df$condition))




t.test(time_spent_homepage_sec ~ condition, data = ad.df)
ad.aov.con <- aov(time_spent_homepage_sec ~ condition, data = ad.df)
anova(ad.aov.con)
anova(aov(time_spent_homepage_sec ~ clicked_share + condition, data = ad.df))

library(multcomp)
ad.aov <- aov (time_spent_homepage_sec ~ 0 + condition, data = ad.df)
glht(ad.aov)
plot(glht(ad.aov),
     xlab = "Total seconds spent", main = "Average seconds spent by Segment (95% CI)", cex.axis = 0.5)




