=begin 

Build a program that displays when the user will retire and how many 
years she has to work till retirement.

Example:

What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!


Understand the Problem
--------------
Input: two strings from the user
Output: Display two strings to the user. 



Examples/Test Cases
--------------
Check that we receive positive ints from the user?



Data Strutcures
--------------
Current age can be converted from str to an int.
Retiurement age can be converted from str to an int.

Can do the calculations we need with ints.

Algorithm
--------------
START

GET age of user
SET age of user

GET retirement age
SET retirement age

SET years to work at retirement age minus current age

READ current year
SET retirement year by adding years to work to current year

PRINT current year and retirement year
PRINT years to work

END

=end

# requiring Date to dynamically confirm the current year
# if not available, we could instead set a global variable to the current year 
require 'Date'


print "What is your age? "
current_age = gets.to_i

print "At what age would you like to retire? "
retirement_age = gets.to_i

years_to_work = retirement_age - current_age
current_year = Date.today.year
retirement_year = current_year + years_to_work

puts
puts "It's #{current_year}. You will retire in #{retirement_year}."
puts "You have only #{years_to_work} years of work to go!"
