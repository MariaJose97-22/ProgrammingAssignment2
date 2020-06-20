## The makecacheatrix function creates a special "matrix" (it is a list really), which can be used to return the inverse of the matrix given.

makecachematrix<-function(x=matrix()){
  ## First the main argument of the function is a matrix given by the user.
  inv<-NULL
  ## When created "inv", the inverse matrix can be store. 
  set<-function(y){
  ## It is defined the set function to assign another one.
    x<<-y
  ## It allows to call the function in the parent enviroment,so it can be called outside the function.
    inv<<-NULL
  ## With new matrix, reset inv to NULL.
  }
  get<-function()x
  ## Define a function , which return the value of the argument matrix.
  setinverse<-function(theinverse)inv<<-theinverse
  ## Assign the inv to a parent enviroment,so it can be called outsie the function.
  getinverse<-function()inv
  ## Bringst the value inv when called.
  list(set=set,get=get,setinverse=setinverse,getinverse=getinverse)
  ## It is needed this class of object to return the matrix and its inverse using the operator "$".
}
## An example of how to use this function is: > example<-makecachematrix(matrix()).
## An example of how to called the matrix created above is: > example$get().

## CacheSolve is a function that computes the inverse of the matrix(return by the makecachematrix function).

cacheSolve <- function(x, ...) {
  ## This function may retrieve the value  of the inverse matrix, using as argument the first function by its name.
  
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data, ...)
  x$setinverse(inv)
  inv
  
}
## An example: >cacheSolve(example).