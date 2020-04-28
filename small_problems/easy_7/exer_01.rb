=begin

Input: Two arrays
Output: One new array

Explicit Requirements
Return a new array
New array contains all elements from the arguments, in alternating order
Arrays are nonn-empty and same length

Implicit Req's
Validate for non-array input?
Take the first element from the first argument passed in, not the second

Iterate through both arrays simultaneously, adding an element from each to the new array

Algorithm
----------
SET a new array
ITERATE through each array at the same time
  - on each iteration, add the ith element from each array to the new array
RETURN the new array

=end

def interleave(array1, array2)
  array1.zip(array2).flatten
end

def interleave2(array1, array2)
  combined_array = []
  counter = 0
  until counter == array1.size
    combined_array << array1[counter]
    combined_array << array2[counter]
    counter += 1
  end
  combined_array
end

puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
puts interleave2([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']