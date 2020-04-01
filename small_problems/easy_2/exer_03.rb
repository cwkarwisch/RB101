=begin 

Create a simple tip calculator. The program should prompt for a bill amount and a tip rate. The program must compute the tip and then display both the tip and the total amount of the bill.

Example:

What is the bill? 200
What is the tip percentage? 15

The tip is $30.0
The total is $230.0

Understand the Problem
----------------
Input: two strings from the user, a bill and a tip amount
Output: print two strings to the user computing the top and the total bill.
Don't print a new line after our prompt to the user.

Examples/Test Cases
------------------
The examples show answers to one decimal, which is odd for dollars and cents
Handle a tip percentage less than 1%? User may have entered 0.15 for 15%
  Could prompt them to make sure they want to tip so little!
Want us to validate inputs? Make sure no negative bills or tip rates?
No non-number inputs?

Data Structures
------------------
Need to handle inputs that are either floats or ints
Convert input strings to floats
Use string interpolation to print the tip and total bill. 


Algorithm
------------------
GET bill from user
SET bill

GET tip percentage form user
SET tip percentage

Calculate tip and total bill

PRINT to user

=end

print "What is the bill? "
bill = gets.chomp

print "What is the tip percentage? "
tip_percent = gets.chomp

tip = bill.to_f * (tip_percent.to_f / 100)
total_bill = bill.to_f + tip

puts
puts "The tip is $#{sprintf("%.2f", tip)}"
puts "The total is $#{sprintf("%.2f", total_bill)}"
