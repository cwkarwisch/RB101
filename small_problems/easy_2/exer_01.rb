=begin

Build a program that randomly generates and prints Teddy's age. To get the age,
you should generate a random number between 20 and 200.

Example Output

Teddy is 69 years old!

Understand the Problem
------------
Input: none
Output: printing a string

Examples/Test Cases
------------
Want a return value or OK with nil?
Don't take any inputs so don't have to deal with any issues there.
Should the age be inclusive of 20 and 200?

Data Structures
------------
Output a string
Use string interpolation to print the message
Use a number to calculate Teddy's age

Algortihm
------------
SET age equal to the randomly generated number
PRINT the message using string interpolation

use Kernel#rand to generate the number with our range provided as the argument

=end

def teddys_age
  puts "Teddy is #{rand(20..200)} years old!"
end 

teddys_age