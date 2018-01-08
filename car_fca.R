###This is a dataset with some FCA analysis of car crashes data 

# Load libraries
library("FactorMineR")
library("factoextra")
library("gplots")


## Load Data
data <- read.csv("~/Documents/GitHub/car_crushes/nassCDS_tr.csv", header = TRUE, row.names = 1) 
#In this method, you should determine in which column are your rows name. In this case, is in my first one (row.names=1)

## Data Format
dtmatrix <- as.table(as.matrix(data))
balloonplot(t(dtmatrix), main ="Car Crashes", xlab ="", ylab="",
            label = FALSE, show.margins = FALSE)

## Doing the Chi Square test to see if there's a need to procede with the analysis
sqrtest <- chisq.test(data)
pvalue_sqr<-round(sqrtest$p.value, digits = 2)
cat("The p-value of the chi-sqr test is", pvalue_sqr)
if (pvalue_sqr<0.05) {cat("\n You should reject the null hyp, cause p-value is < 0.05 You have significant different proportions \n")}
if (pvalue_sqr>0.05) {cat("\n You have failed to reject the null hyp, cause p-value is > 0.05 There is no statistically significant difference in the proportions \n")}


### Compute CA with Factor Miner (res.ca_FM)
library("FactoMineR")
res.ca_FM<- CA(data, graph = TRUE)
#Visualization
fviz_ca_biplot(res.ca_FM, repel = TRUE)
#For colums
fviz_ca_row(res.ca_FM, col.row = "cos2",
            gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), 
            repel = TRUE)

#for both column and rows
fviz_ca_biplot(res.ca_FM, map="symbiplot"
                , geom = "text" ,
               repel = TRUE, col.col = "#6AB187", col.row= "#EA6A47")
