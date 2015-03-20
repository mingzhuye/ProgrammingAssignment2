## I'm writing a pair of functions that cache the inverse of a matrix.

## This 'makeCacheMatrix' function creates a special "matrix" object that 
## can cache its inverse.

makeCacheMatrix <- function(x = matrix()){
        ## store the result of "solve" to m
        m <- NULL
        
        ## create the matrix        
        set <- function(y){
                x <<- y
                m <<- NULL
        }
        
        ## get the matrix
        get <- function() x
        setsolve <- function(solve) m <<- solve
        getsolve <- function() m 
        
        ## store the methods in a list so that they can be accessed using $      
        list(set = set, get = get,
             setsolve = setsolve, getsolve = getsolve) 
}


## This 'cacheSolve' function computes the inverse of the special "matrix" returned 
## by 'makeCacheMatrix' above.

cacheSolve <- function(x, ...) {
        ## Return the inverse matrix of 'x'
        m <- x$getsolve()
        
        ## If the inverse has already been calculated (and the matrix has not changed),
        ## then the cacheSolve should retrieve the inverse from the cache.
        if (!is.null(m)){
                message("getting cached data")
                m
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
}

