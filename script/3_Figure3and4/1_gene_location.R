install.packages("gggenes")
install.packages("ggplot2")
install.packages("RColorBrewer")
library(gggenes)
library(ggplot2)
library(RColorBrewer)
setwd("G://projectR/gggenes/")
getwd()
data(example_genes)
example_genes<-read.csv("proteins_1201.csv",sep = ",",header = T)

dummies <- make_alignment_dummies(
  example_genes,
  aes(xmin = start, xmax = end, y = molecule, id = gene),
  on = "copA"
)
example_genes$direction <- ifelse(example_genes$strand == "forward", 1, -1)

ggplot(example_genes, aes(xmin = start, xmax = end, y = molecule, fill = gene, forward=direction)) +
  geom_gene_arrow() +
  facet_wrap(~ molecule, scales = "free", ncol = 1) +
  theme_genes()+
  scale_fill_manual(values = colorRampPalette(brewer.pal(3, "Accent"))(colourCount)) +
  theme(legend.position="bottom") +
  guides(fill=guide_legend(nrow=6))
