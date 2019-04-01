do_parallel_function <- function() {
  
  # Prepare Parallel Process
  cluster <- makeCluster(detectCores() - 1) # convention to leave 1 core for OS
  registerDoParallel(cluster)
  
  return(print(cluster))
  }
