## Put comments here that give an overall description of what your
## functions do

## the function creates a "matrix" object with 4 operations
##  - set a matrix value
##  - get a matrix value
##  - setinverse - set an inverse matrix
##  - getinverse - get an inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  iM <- NULL
  set <- function(y) {
    x <<- y
    iM <<- NULL
  }
  get <- function() x
  setinverse <- function(inverseMatrix) iM <<- inverseMatrix
  getinverse <- function() iM
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## the function calculates the inverse matrix of the matrix object created above

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  iM <- x$getinverse()
  if(!is.null(iM)) {
    message("getting cached data")
    return(iM)
  }
  data <- x$get()
  iM <- solve(data, ...)
  x$setinverse(iM)
  iM  
}
