=begin

Build a program that asks a user for the length and width of a room in meters 
and then displays the area of the room in both square meters and square feet.

Note: 1 square meter == 10.7639 square feet

Do not worry about validating the input at this time.

Example Run

Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.0 square meters (753.47 square feet).


Understand the Problem
---------
Not writing a specific method, but an interactive program.
Will take two inputs from the user as a prompt.

Will output a string message.
Will need to perform calculations based on the user's input.
Using gets, we will recieve strings, and those will need to be converted 
to ints.


Examples/Test Cases
---------
Don't need to validate inputs.
Would want to confirm our numbers are positive.
The example shows integers, but assume we want to be able to handle floats, 
and the answer shown gives the size of the room as floats.

What precision to use for the float output? Example shows 1 digit for square
meters and 2 digits for square feet.

Data Structures
---------
Get strings from user
Convert to floats
Print our message


Algorithm
---------
-GET the length of the room from the user
-SET length
-GET the wifth of the room from the user
-SET width
- PRINT the response using string interpolation

=end

puts ">>> Enter the length of the room in meters:"
length = gets.to_f

puts ">>> Enter the width of the room in meters:"
width = gets.to_f

puts ">>> The area of the room is #{(length * width).round(1)} square meters\
(#{(length * width * 10.7639).round(2)} square feet)."
