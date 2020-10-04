

### QUESTION a)

setwd("~/STA2535")


# life contingencies package in R
require("lifecontingencies")
?soa08
data(soa08Act)
# we need an actuarial table life table 


l_table <- soa08Act
# example in the lecture
A70_10 <- Axn(l_table, 70, 10)
dot_a70_10 <-  axn(l_table, 70, 10)
  
premium <- (1000000 * A70_10 + 4500 + 500 * dot_a70_10) / 
            (0.9 * dot_a70_10 - 0.4)

premium
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



### QUESTION b)

# we need n-term pure endowment

A70_10_1 <- Exn(l_table, 70, 10)
premium_b <- (1000000 * A70_10 + 4500 + 500 * dot_a70_10) / 
             (0.9 * dot_a70_10 - 0.4 - 5* A70_10_1)
# premium with refund
premium_b
# premium without refund
premium


