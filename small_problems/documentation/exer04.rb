a = [1, 4, 8, 11, 15, 19]

puts a.bsearch { |x| x > 8 }

# Array#bsearch uses binary search to find a value in an array which meets the given condition
# in O(log n). There are two modes for this method, but here we use the find minimum (rather than
# the find any mode). Elements in the array must be sorted to use this method.

# In the find minimum mode, Array#bsearch will return the value of the first element for which
# the block evaluates to true. The array must be sorted in such a way that every value to the left
# of the found element will evaluate to false when passed through the block, and every element
# to the right of the found element will evaluate to true when passed through the block.  