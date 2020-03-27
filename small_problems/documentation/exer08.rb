a = [5, 9, 3, 11]
puts a.min

puts a.min(2)

# In the (old) documentation for Enumerable#min, using the signature min(n) → array, 
# if the n argument is given, minimum n elements are returned in an array.  