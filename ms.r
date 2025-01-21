calcMS <- function(points, dimensions, lowerBound, upperBound, fn) {
  msRes <- replicate(points, optim(runif(dimensions, min = lowerBound, max = upperBound), fn, method = "L-BFGS-B",
                                 lower = rep(lowerBound, dimensions), upper = rep(upperBound, dimensions)))
  
  calls <- c()
  for (i in seq_along(msRes[3,])){
    calls <- append(calls, msRes[3,][[i]]["function"])
  }
  
  
  minValue <- min(unlist(msRes[2,]))
  return (c(minValue, sum(calls)))
}
