library(BiasedUrn)
# filename = "C:\\Users\\sghao99\\Desktop\\9-dec\\40_perc_+.tabular.edited.parsed.checked.filled_with_zero.csv"
filename = "D:/projectR/multipulfor2048ARG/shaped2048.csv"
d <- read.csv(file = filename, sep = ',', header = T, row.names = 1)

# Test if a genus is enriched of AR genes.
# Note: Use the reshaped table (Genera as
# column names)
x <- d[-89,]$ERR315859
m <- d[-89,]$Total
n <- d[-1:-88,]$ERR315859
odds <- rep(1, times = 88)

# Test if an AR gene is enriched in genera
# x <- d[-14,]$oleb
# m <- d[-14,]$Total
# n <- d[-1:-13,]$oleb
# odds <- rep(1, times = 13)

dMFNCHypergeo(x, m, n, odds)