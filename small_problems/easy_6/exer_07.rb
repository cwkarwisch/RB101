=begin

Understand the Problem
--------------
Input: single array
Output: nested array

Explicit Req's:
first half array should contain the first half of the elements in the input arr
if the input array has an odd number of elements, place middle element in first half array

Implicit Req's:
- Mutate the original array or return a new array?
- Validate for array input?
- Empty array should return two nested arrays
- If array contains one element, it should be placed in the first half array, and
  the second half array should be empty

Count the number of elements in the array
Place the elements in the first half of the array into the new first half array
If the element count is odd, place the middle element into the first half array
Place the elements in the second half array into the second half array

Algorithm
-------------
SET three empty arrays, one for the first half and one for the second half, and one to hold the nested array
SET the first half index equal to the number of elements / 2
  IF the number of elements is odd, increment the first half index by 1

ITERATE through the input array
  IF the index position of the element is less than or equal to the first half index, shovel into the first half array
  IF the index position of the element is greater than the first half index, shovel the element into the first half array

RETURN the nested array

=end

def halvsies(input_array)
  nested_array = [[], []]
  first_half_array = nested_array[0]
  second_half_array = nested_array[1]

  first_half_index = input_array.size / 2
  first_half_index += 1 if input_array.size.odd?

  input_array.each_with_index do |elem, index|
    first_half_array << elem if index < first_half_index
    second_half_array << elem if index >= first_half_index
  end

  nested_array
end

puts halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
puts halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
puts halvsies([5]) == [[5], []]
puts halvsies([]) == [[], []]