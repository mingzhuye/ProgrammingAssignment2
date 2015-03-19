cacheSolve <- function(x, ...){
        m <- x$getsolve()
        if (!is.null(m)){
                message("getting cached data")
                m
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
}