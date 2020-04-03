=begin

Write a program that prompts the user for two positive integers, and then 
prints the results of the following operations on those two numbers: 
addition, subtraction, product, quotient, remainder, and power. 
Do not worry about validating the input.

Understand the Problem
------------
Input: two strings from user, to be converted to ints
Output: 6 messages to the user containing the operations

Examples/Test Cases
------------
No need to validate inputs
If we did validate, would need to handle 0 as a second input
If we used floats, we may want to consider rounding the answers.

Data Structures
------------
Convert strings to ints

Algorithm
------------
GET x
SET x

GET y
SET y

perform operations; print results

=end

puts "==> Enter the first number:"
x = gets.to_i

puts "==> Enter the second number:"
y = gets.to_i

puts "#{x} + #{y} = #{x + y}"

puts "#{x} - #{y} = #{x - y}"

puts "#{x} * #{y} = #{x * y}"

puts "#{x} / #{y} = #{x / y}"

puts "#{x} % #{y} = #{x % y}"

puts "#{x} ** #{y} = #{x ** y}"
