=begin

Write a method that takes one argument, an array containing integers, and returns the average of
all numbers in the array. The array will never be empty and the numbers will always be positive integers.

Examples:

puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
The tests above should print true.

Understand the Problem
----------
Input = array of positive integers
Output = a single integer
Based on example, assume we want to do integer division in arriving at the average


Examples/Test Cases
----------



Data Structures
---------
Start with array
Create an int that will holds the sum of all ints
Create an int that will hold the average


Algorithm
-----------
Create a variable named sum equal to 0
Iterate through the array and add the value of each element to sum
Divide sum by the number of digits in the array (array.length)


=end


def average(array)
  sum = 0
  array.each { |number| sum += number }
  sum / array.length
end 

puts average([2, 4])
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40