=begin

Problem
-----
Input: two arrays
Output: single array

Explicit Req's:
Returns a new array
Arrays will have same length
New array will contain product of elements in input arrays that have the same index

Implicit Req's
Empty arrays return empty array?

Iterate through each array at the same time, multiplying the numbers together and adding them
to the new array

Algorithm
--------
SET empty new array
ITERATE through each array at the same time
  - MULTIPLY the numbers together
  - ADD the product to the new array
RETURN the new array

=end

def multiply_list(array1, array2)
  product_array = []
  counter = 0
  until counter == array1.size
    product = array1[counter] * array2[counter]
    product_array << product
    counter += 1
  end
  product_array
end

def multiply_list2(array1, array2)
  array1.zip(array2).map {|arr| arr.inject(:*)}
end

puts multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
puts multiply_list2([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
