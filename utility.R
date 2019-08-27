segList <- function(data) {
  
  #data <- list(letters,LETTERS);
  
  res <- lapply(data,function(row){
    paste(row,collapse = " ");
  })
  
  res <- as.character(res);
  res <- paste(res,collapse = "\n");
  
}

segList2Vec <- function(data) {
  
  #data <- list(letters,LETTERS);
  
  res <- lapply(data,function(row){
    paste(row,collapse = " ");
  })
  
  res <- as.character(res);
  #res <- paste(res,collapse = "\n");
  return(res)
  
}

editor_char <- function(text){
  res <-strsplit(text,"\n");
  res <- res[[1]]
  return(res);
}


