library(gplots)
setwd("G:/projectR/heatmap//")
data5=read.csv("BP.csv", sep=",", header = T,row.names = 1)
matr<-data.matrix(data5)
heatmap.2(matr,col=colorRampPalette(c("green","lightgray","red")),scale="column",
          key=TRUE,symkey=FALSE,density.info="none",trace="none",labRow = data5$GO,Rowv=NA,Colv=NA)
#heatmap.2(matr,Rowv=NA,Colv=NA,dendrogram=('none'), distfun=dist, hclustfun=hclust,col=cm.colors(256),keysize=1.5,margins=c(5,10),density.info=c('none'),
          #trace="none",vline=NA,hline=NA,)
install.packages("pheatmap")
library(pheatmap)
pheatmap(data5,cluster_cols  = FALSE)
pheatmap(test)