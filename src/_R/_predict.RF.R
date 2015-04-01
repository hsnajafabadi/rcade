#  Copyright 2014 Hamed S. Najafabadi
#  
#  ********************************************************************
#  
#  This file is part of ZifRC package.
#  
#  ZifRC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#  
#  ZifRC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with ZifRC.  If not, see <http://www.gnu.org/licenses/>.
#  
#  ********************************************************************/


args <- commandArgs(trailingOnly = TRUE)

library(randomForest)
data <- read.csv(paste("./tmp/",args[1],"/_predict.in",sep=""),sep="\t")

############### construct the matrix of predictors
covariates <- data[,c(7,9,10,13)]

############### run the model for each position and each nucleotide
for (i in 14:25 )
{
	load(paste("./src/_R/",colnames(data)[i],".RF.RData",sep=""))	
	data[,i] <- predict(model,covariates)
	rm(model)
}

############### reconstruct the matrix of predictors for specificity
covariates <- data[,2:13]
load(paste("./src/_R/Bind.RF.RData",sep=""))	
data[,30] <- predict(model,covariates,type="Prob")[,2]
rm(model)

write.table(data,file=paste("./tmp/",args[1],"/_predict.RF.out",sep=""),sep="\t",row.names=F)

rm(covariates)
rm(data)
