=begin

Write a method that takes two arguments, a positive integer and a boolean, and
calculates the bonus for a given salary. If the boolean is true, the bonus 
should be half of the salary. If the boolean is false, the bonus should be 0.

Examples:

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
The tests above should print true.


Understand the Problem
---------
Input: a positive int and a bool
Output: Integer




Examples/Test Cases
---------
Have a default if bool left out?
Handle negative or 0 as salary input?


Data Structures
---------
Only need ints and arithmetic


Algorithm
---------
-IF bool is true
 - bonus equals half the salary
- ELSE
  - bonus equals 0

=end

def calculate_bonus(salary, bool)
  bool ? salary / 2 : 0
end 

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000