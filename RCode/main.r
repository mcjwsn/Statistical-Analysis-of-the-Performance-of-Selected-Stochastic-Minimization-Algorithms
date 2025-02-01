library(stats)
library(smoof)
source("prs.r")
source("ms.r")

compar <- function(fn, dimensions, bounds) {
    print(paste("Wymiary:", dimensions))
    msRes <- replicate(100, calcMS(100, dimensions, bounds[1], bounds[2], fn))
    
    msValue <- msRes[1,]
    budget <- round(mean(msRes[2,]))
    
    print("MS:")
    print(paste("Średnia wartość:", mean(msValue)))
    print(paste("Budżet:", budget))
    
    prsValue <- replicate(100, prs(fn, generatePoints(budget, dimensions, bounds[1], bounds[2])))
    
    print("---------")
    print("PRS:")
    print(paste("Średnia wartość:", mean(prsValue)))
    
    return (list(msValue, prsValue))
}

griewankBounds <- c(-600, 600)
print("Funkcja Griewank")
griewank2D <- compar(makeGriewankFunction(2), 2, griewankBounds)
griewank2Dms <- griewank2D[[1]]
griewank2Dprs <- griewank2D[[2]]

write.csv(griewank2Dms, file = "./data/griewank2Dms.csv", row.names = FALSE)

write.csv(griewank2Dprs, file = "./data/griewank2Dprs.csv", row.names = FALSE)

print("========================")
griewank10D <- compar(makeGriewankFunction(10), 10, griewankBounds)
griewank10Dms <- griewank10D[[1]]
griewank10Dprs <- griewank10D[[2]]

write.csv(griewank10Dms, file = "./data/griewank10Dms.csv", row.names = FALSE)

write.csv(griewank10Dprs, file = "./data/griewank10Dprs.csv", row.names = FALSE)

print("========================")
griewank20D <- compar(makeGriewankFunction(20), 20, griewankBounds)
griewank20Dms <- griewank20D[[1]]
griewank20Dprs <- griewank20D[[2]]

write.csv(griewank20Dms, file = "./data/griewank20Dms.csv", row.names = FALSE)

write.csv(griewank20Dprs, file = "./data/griewank20Dprs.csv", row.names = FALSE)

print("")

schwefelBounds <- c(-500, 500)
print("Funkcja Schwefel")
schwefel2D <- compar(makeSchwefelFunction(2), 2, schwefelBounds)
schwefel2Dms <- schwefel2D[[1]]
schwefel2Dprs <- schwefel2D[[2]]

write.csv(schwefel2Dms, file = "./data/schwefel2Dms.csv", row.names = FALSE)

write.csv(schwefel2Dprs, file = "./data/schwefel2Dprs.csv", row.names = FALSE)

print("========================")
schwefel10D <- compar(makeSchwefelFunction(10), 10, schwefelBounds)
schwefel10Dms <- schwefel10D[[1]]
schwefel10Dprs <- schwefel10D[[2]]

write.csv(schwefel10Dms, file = "./data/schwefel10Dms.csv", row.names = FALSE)

write.csv(schwefel10Dprs, file = "./data/schwefel10Dprs.csv", row.names = FALSE)

print("========================")
schwefel20D <- compar(makeSchwefelFunction(20), 20, schwefelBounds)
schwefel20Dms <- schwefel20D[[1]]
schwefel20Dprs <- schwefel20D[[2]]

write.csv(schwefel20Dms, file = "./data/schwefel20Dms.csv", row.names = FALSE)

write.csv(schwefel20Dprs, file = "./data/schwefel20Dprs.csv", row.names = FALSE)