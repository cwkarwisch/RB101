=begin

Understand the Problem
-----------
In: String
Out: print banner/box to the terminal

There are +s in each corner of the box
Even if we are passed, we print two horixontal dashes between the corners
  and three longger vertical dashes between the corners

The horizontal dashes need to scale with the length of the message.
Looks like pattern should be print + print - then print dashes for the length
  of the message then print - then print +.

Vertically, the message itself is printed in the middle vertical dash.
Could use string interpolation

Examples/Test Cases
-----------


Data Structures
-----------


Algorithm
-----------


=end

def print_in_box(message)
  puts "+-#{"-" * message.length}-+"
  puts "| #{" " * message.length} |"
  puts "| #{message} |"
  puts "| #{" " * message.length} |"
  puts "+-#{"-" * message.length}-+"
end

print_in_box("To boldly go where no one has gone before.")