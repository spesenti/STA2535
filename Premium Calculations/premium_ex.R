
### Example with premium from lecture

### QUESTION a)

setwd("~/STA2535")


# life contingencies package in R
# the following two commands might be necessary
# install.packages("lifecontingencies")
# library(lifecontingencies)
require("lifecontingencies")

# actuarial life table 
?soa08Act
data(soa08Act)
soa08Act

l_table <- soa08Act

# n-year term life insurance
?Axn
A70_10 <- Axn(l_table, 70, 10) # default interest is 6%

# n-year term annuity due 
?axn
dot_a70_10 <-  axn(l_table, 70, 10)
  
premium <- (1000000 * A70_10 + 4500 + 500 * dot_a70_10) / 
            (0.9 * dot_a70_10 - 0.4)

premium

# How does the premium change for different interest rates? 
# more realistic with lower interest rates 

premium_interest <- function(i){
  .A70_10 <- Axn(l_table, 70, 10, i = i)
  .dot_a70_10 <-  axn(l_table, 70, 10, i = i)
  
  .premium <- (1000000 * .A70_10 + 4500 + 505 * .dot_a70_10) / 
    (0.9 * .dot_a70_10 - 0.4)
return(.premium)  
}

premium_interest(0.01)
premium_interest(0.03)
premium_interest(0.06)

 
# plot premium by interest rates
int_seq <- seq(0.001, 0.06, by = 0.001)
pre <- rep(NA, length(int_seq))

for(k in 1:length(int_seq)){
  pre[k] <- premium_interest(int_seq[k])
}

plot(int_seq, pre, main = "premium for different interest rates", xlab = "Interest rate",
     ylab = "premium", pch = 16, cex = 0.5, col = "green")



### QUESTION b) (interest is 6%)

# we need n-term pure endowment

A70_10_1 <- Exn(l_table, 70, 10)
premium_b <- (1000000 * A70_10 + 4500 + 500 * dot_a70_10) / 
             (0.9 * dot_a70_10 - 0.4 - 5* A70_10_1)
# premium with refund
premium_b
# premium without refund
premium


