=begin

Write a program that asks the user to enter an integer greater than 0, then 
asks if the user wants to determine the sum or product of all numbers between
1 and the entered integer.

Examples:

>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.


>> Please enter an integer greater than 0:
6
>> Enter 's' to compute the sum, 'p' to compute the product.
p
The product of the integers between 1 and 6 is 720.

Understand the Problem
------------
The second number is inclusive, we also add and multiply with that number
Input: two strings from the user
Output: print a message containing the sum or product

Examples/Test Cases
------------
Validate we received a positive int


Data structures
------------
Input two strings, the first of which we need to convert to an integer
for operations
Once we have the int and the know what the user wants to do, need to populate 
a DS with the numbers between 1 and the user input
  - could populate an array using [*] syntax
    - with an array we could then use reduce to sum or multiply the nums
    - we can probably use reduce on an upto and others as long as 
    it's an enumerable
  - could use a for in loop, while loop, or upto
 

Algorithm
------------
START
GET an int from the user
Validate that the user entered a positive int
  - reprompt if they did not
  - once positive int received, SET the upper bound

GET the operation from the user
Validate that the user entered a s or p
  - reprompt if they did not (using downcase)
  - once s or p is entered, SET the operation

SET the accumulator

IF operation is sum
  - create array with the values
  - reduce the array
  - return the accumulated sum
Else (operation is product)
  - create array with the values
  - reduce the array, performing multiplication
  - return the accumulated product

Print the message containing the accumulator 

END

=end

# obtain upper bound from the user
upper_bound = 0
loop do
  puts ">>> Please enter an integer greater than 0:"
  upper_bound = gets.chomp
  break if upper_bound.to_i > 0
end 

# obtain operation to be performed from the user
operation = nil
loop do
  puts "Enter 's' to compute the sum, 'p' to compute the product."
  operation = gets.chomp.downcase
  break if operation == 's' || operation == 'p'
end 

if operation == 's'
  array = [*1..upper_bound.to_i]
  sum = array.reduce(0, :+)
  puts "The sum of the integers between 1 and #{upper_bound} is #{sum}."
else 
  array = [*1..upper_bound.to_i]
  product = array.reduce(1, :*)
  puts "The product of the integers between 1 and #{upper_bound} is #{product}."
end 

