=begin

Write a program that solicits 6 numbers from the user, then prints a message 
that describes whether or not the 6th number appears amongst the 
first 5 numbers.

Understand the Problem
---------
Input: 6 numbers from the user
Will creata s DS to hold the user's input
Scan the input to determine if 6 number is in the DS
Output: Print message to user

Write out the prompts or make them more dynamic?
Make searching more efficient? 
Sort the data first?
Examples show us displaying an unsorted array, but we could still
sort behind the scenes.  

Examples/Test Cases
---------
Validate user entered numbers?
Accept floats?

Data Structures
---------
Array to hold the user input

Algorithm
---------
SET empty array

GET first number
shovel the element into the array

GET second number
Shovel the element into the array

.....

GET sixth number
SET sixth number

INCLUDE? the array to see if the 6th number exists
PRINT appropriate message to user

=end
array = []

puts "==> Enter the 1st number:"
num1 = gets.to_i
array << num1

puts "==> Enter the 2nd number:"
num2 = gets.to_i
array << num2

puts "==> Enter the 3rd number:"
num3 = gets.to_i
array << num3

puts "==> Enter the 4th number:"
num4 = gets.to_i
array << num4

puts "==> Enter the 5th number:"
num5 = gets.to_i
array << num5

puts "==> Enter the last number:"
num6 = gets.to_i

=begin
if array.include?(num6)
  puts "The number #{num6} appears in #{array}."
else
  puts "The number #{num6} does not appear in #{array}."
end 
=end 

sorted_array = array.sort
if sorted_array.bsearch { |num| num - num6 }
  puts "The number #{num6} appears in #{array}."
else
    puts "The number #{num6} does not appear in #{array}."
end   


