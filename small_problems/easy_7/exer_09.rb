=begin

Problem
-----
Input: two arrays
Output: single array

Explicit Req's:
  - Return a new array
  - new array will contain the product of every pair of numbers that can be formed
    by the numbers in the two arrays
  - the new array must be sorted

Implicit Req's
Can assume neither array is empty
Validate for non-array input?

Iterate through the first array, and multiply each element in the first array
by each element in the second array

Place the product of each pair into the new array, and sort when we're done

Algorithm
-------

SET empty array
ITERATE through the first array
  - multiply each element in the first array by each element in the second array
  - add the product of the multiplication to the new array
SORT the new array
RETURN the new array

=end

def multiply_all_pairs(array1, array2)
  new_array = []
  array1.each do |num1|
    array2.each do |num2|
      new_array << num1 * num2
    end
  end
  new_array.sort
end

puts multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
