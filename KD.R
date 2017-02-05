# Include quantmod package
library(quantmod)

# Read file
setwd("/Users/raywu/R") # work directory
files <- list.files(path = "/Users/raywu/R", pattern ="*.list")
file_count <- length(list.files( path = "/Users/raywu/R", pattern ="*.list"))

# Get stock list
for ( i in 1:file_count){
  assign ( files[i], read.table( files[i], header = FALSE, sep = "\n"))
}

markets <- list( test.list, tw.list, sh.list, sz.list )
markets_counts <- c( test = nrow(test.list), tw = nrow(tw.list), sh = nrow(sh.list), sz = nrow(sz.list))

# Get stock data
for ( x in 1:markets_counts[2] ){
  getSymbols(toString(tw.list[x,1]), src="yahoo", from="2017/01/01")
}




for ( x in 1:file_count ){
  for ( y in 1:markets_counts[x]){
    getSymbols(toString( markets[[x]][y,1]), src="yahoo", from="2017/01/01")
  }
}
