library(rlist)

prs <- function(fn, points) {
  minValue <- Inf
  for (i in seq_along(points)) {
    value <- fn(points[[i]])
    minValue <- min(minValue, value)
  }
  return (minValue)
}
generatePoints <- function(n, dimensions, lower, upper) {
  res <- list()
  for (i in 1:n) {
    res <- list.append(res, runif(dimensions, min = lower, max = upper))
  }
  return (res)
}