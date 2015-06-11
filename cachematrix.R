## These 2 functiones are based on functions makeVector() and cachemean()
## by Peng et al. as published in 
## https://class.coursera.org/rprog-015/human_grading/view/courses/973496/assessments/3/submissions

## The makeCacheMatrix function
## recieves an invertible matrix as input
## and returns a list of functions that:
## sets the value of the matrix (set function)
## gets the value of the matrix (get function)
## sets the value of the inverted matrix (setsolve function) 
## gets the value of the inverted matrix (getsolve function)

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
##  print("applying set")
                x <<- y
                m <<- NULL
        }
        get <- function() {
## print("applying get")
                x}
        setsolve <- function(solve) {
## print("applying setsolve")
                m <<- solve}
        getsolve <- function() {
## print("applying getsolve")
                m}
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}

## The cacheSolve function
## checks if the inverted matrix is already stored in the memory.
## If the inverted matrix is already in memory, it returns its stored value.
## If the inverted matrix had not been already stored in the memory, then:
## 1) the matrix is recalled by the get() function that had
## been defined in the makeCacheMatrix() function,
## 2) the matrix is inverted by the solve() function, 
## 3) the inverted matrix is stored in memory using the setsolve() function
## defined in the makeCacheMatrix() function, and
## 4) the inverted matrix is returned.


cacheSolve <- function(x, ...) {

        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }

        data <- x$get()
        m <- solve(data, ...)
        x$setsolve(m)
        m
}
