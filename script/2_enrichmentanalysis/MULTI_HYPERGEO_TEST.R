library(BiasedUrn)
#filename = "AR_TYPE_AND_TAXA.ZERO_FILLED.csv"
filename = "AR_TYPE_AND_TAXA.ZERO_FILLED.RESHAPED.csv"
d <- read.csv(file = filename, sep = ',', header = T, row.names = 1)

# TEST IF A GENUS IS ENRICHED OF ARGS. NOTE: USE THE RESHAPED TABLE (GENERA AS COLUMN NAMES).
x <- d[-76,]$Alteromonas
m <- d[-76,]$Total
n <- d[-1:-75,]$Alteromonas
odds <- rep(1, times = 75)

# TEST IF AN ARG IS ENRICHED IN GENERA. NOTE: USE THE NORMAL TABLE (ARG TYPES AS COLUMN NAMES)
#x <- d[-14,]$oleb
#m <- d[-14,]$Total
#n <- d[-1:-13,]$oleb
#odds <- rep(1, times = 13)

# dMFNCHypergeo AND dMWNCHypergeo GIVE THE SAME RESULT FOR CENTRAL MULTI. HYPERGEO. DIST.
dMFNCHypergeo(x, m, n, odds)
