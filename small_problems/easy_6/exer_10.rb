=begin

Problem
Input: a positive integer
Output: a display of a triangle represented by stars

Eplicit Req's
Hypotenuse runs from lower left to top right
Each side of the triangle should have n stars

Implicit Req's:
print a blank line at beginning
Have sufficient space at beginning of each line so that triangle lines up
No leading whitespace on last line of triangle

Run a loop where start the counter at 1
In first iteration, print n-counter spaces, then print counter num of stars
continue loop until counter == n; include at end of loop

Algorithm
----------
SET counter = 1
while counter <= number
  print space n-counter times and * counter times on the same line
  increment the counter

=end

def triangle(number)
  counter = 1
  while counter <= number
    puts (" " * (number - counter)) + ("*" * counter)
    counter += 1
  end
end

triangle(9)