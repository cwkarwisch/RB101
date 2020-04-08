=begin

Understand the Problem
-----------
Input: an array
Output: an array

return an empty array if we recieve an empty array

Examples/Test Cases
-----------
Validate we receive an array?
Validfate the array is full of nums?
How to handle negative numbers?

Data Structures
-----------
In: array
Out: array
Can stick with arrays while we use numerics for the sum total

Algorithm
-----------
SET empty array to hold running_total
SET sum = 0
ITERATE through the input array
  - sum = sum + current_elem in the array
  - shovel sum into the running_total_array
RETURN running_total array

=end

def running_total(input_array)
  running_total_array = []
  sum = 0
  input_array.each do |num|
    sum += num
    running_total_array << sum
  end
  running_total_array
end

def running_total2(input_array)
  sum = 0
  input_array.each_with_object([]) { |num, arr| arr << sum += num }
end 

def running_total3(input_array)
  sum = 0
  input_array.inject([]) { |arr, num| arr << sum += num }
end 

puts "tests"
puts "----------"

puts running_total3([2, 5, 13]) == [2, 7, 20]
puts running_total3([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total3([3]) == [3]
puts running_total3([]) == []
