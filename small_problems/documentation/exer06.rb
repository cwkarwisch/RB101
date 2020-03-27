5.step(to: 10, by: 3) { |value| puts value }

# The signature for Numeric#step shopws that the order of the paramters should be 
# by: step, to: limit. That is reversed here, but I suspect it does not throw an
# error since the paramters are labeled.  

# If no error is thrown, it should print:
# 5
# 8