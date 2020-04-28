=begin

Problem
----------
Input: Array
Output: the duplicate value

Explicit Req's:
Only one duplicat evalue
Find and return the duplicate

Implicit Req's:
Can we assume the array contains numbers or be prepared to work with any type?
Validate for non-array input?
Req's state we won't be given an empty array.

Starting with the first element in the array, iterate through the remaining elements in the array
  - At each element, check whether the value equals the element ebing compared to
  - If we find a match, return that element

Algorithm
-----------
SET outer loop to iterate through the entire input array
SET outer_loop_idx equal to 0
  SET inner loop to iterate through every element following our starting point
    SET innter_loop_idx equal to outer_loop_idx + 1
    COMPARE the element at inner_loop_idx to the element at outer_loop_idx
      IF they are equal, return the value
      ELSE, continue looping and comparing
INCREMENT outer_loop_idx by 1
puts "Did not find a match if nothing found"

=end

def find_dup(input_array)
  outer_loop_index = 0
  while outer_loop_index < input_array.size
    inner_loop_index = outer_loop_index + 1
    while inner_loop_index < input_array.size
      return input_array[inner_loop_index] if input_array[outer_loop_index] == input_array[inner_loop_index]
      inner_loop_index += 1
    end
    outer_loop_index += 1
  end
  puts "Did not find a duplicate."
end

puts find_dup([1, 5, 3, 1]) == 1
puts find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73