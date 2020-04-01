=begin

Write a method that takes one argument, a positive integer, and returns the 
sum of its digits.

Examples:

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
The tests above should print true.

For a challenge, try writing this without any basic looping constructs (while, 
until, loop, and each).


Understand the Problem
---------------
Input: a single positive int
Output: an integer


Examples Test Cases
---------------
Handle a zero or negaitve number?
Handle non-integer input?


Data Structures
---------------
Recieve an int
Return an int
But will want to use strings and arrays as an intermediate step to
compute the sum of the digits


Algorithm
---------------
- Convert the input to a string (to_s)
- Split the string into an array of characters (split)
- Reduce the array, converting each string into an int as we reduce
- Return the sum

=end

def sum(integer)
  integer.to_s.split('').reduce(0) { |sum, digit| sum + digit.to_i }
end 

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45