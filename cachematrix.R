## These functions calculate a special matrix and calculate its inverse

## This function creates a list containing a function to
# 1 set the value of the matrix
# 2 get the value of the matrix
# 3 set the inverse of the matrix
# 4 get the inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
  i<-NULL
  set<-function(y){
    x<<-y
    i<<-NULL
  }
  get<-function()x
  setinverse<-function(inverse) i<-inverse
  getinverse<-function() i
  list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
}


## This function calculates the inverse of the matrix (list) calculated with the above function
# it checks if there is the inverse, otherwise it calculates it.

cacheSolve <- function(x, ...) {
  i<-x$getinverse()
  if(!is.null(i)){
    message("getting cached inverse")
    return(i)
  }
  data<-x$get()
  i<-solve(data)
  x$setinverse(i)
  i
}
