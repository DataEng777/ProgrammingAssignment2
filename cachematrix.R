##will create two functions: makeCacheMatrix and cacheSolve

## makeCacheMatrix is a function that creates a special "matrix" object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
              m <- NULL            ## old value of m isn't needed anymore
            set <- function(y)  {  ##set changes the matrix stored in the main function
              x <<- y
              m <<- NULL
            }
            get <- function()      {  ##get returns matrix x stored in the main function
              x
            }
        setmatrix <- function(solve)   {   ##store value m into makeCacheMatrix
              m <<- solve
        }
        getmatrix <- function()      {   ## returns m
              m
        }
        
list(set=set, get=get, setmatrix=setmatrix, getmatrix=getmatrix)  ## list store all functions into makeCacheMatrix
}


## cacheSolve function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
  cacheSolve <- function(x, ...) {
           m <- x$getmatrix()                        ##verifying value of m
    
           if(!is.null(m)) {                      ##if m is on the memory, returns value of m and ends function
                  message("getting cached data")
           return(m)
           }
       dat_matrix <- x$get()                      ## this is the "else" part of "if"
       m <- solve(dat_matrix, ...)                ## m receives the inverse matrix
       x$setmatrix(m)                             
       m
  }
  
  
  
  

