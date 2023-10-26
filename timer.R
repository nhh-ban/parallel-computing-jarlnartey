library(tictoc)

printTicTocLog <-
  function() {
    tic.log() %>%
      unlist %>%
      tibble(logvals = .) %>%
      separate(logvals,
               sep = ":",
               into = c("Function type", "log")) %>%
      mutate(log = str_trim(log)) %>%
      separate(log,
               sep = " ",
               into = c("Seconds"),
               extra = "drop")
  }

tic.clearlog()

tic("Run Script1")
source("scripts/script1.R")
toc(log = TRUE)

tic("Run Script2")
source("scripts/script2.R")
toc(log = TRUE)

tic("Run Script3")
source("scripts/script3.R")
toc(log = TRUE)

printTicTocLog() %>%
  knitr::kable()

# For me, Script1 took 66.04 seconds, Script2 took 56.72 seconds 
# and Script 3 took 49.05. This means that Script3 is the fastest of the three. 