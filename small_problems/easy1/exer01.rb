=begin

Write a method that takes two arguments, a string and a positive integer, and prints the string as
many times as the integer indicates.

Understand the Problem
-----------------------
Two args


Examples/Test Cases
-----------------------
-What if we don't receieve expected inputs?
  - Arguments of other types?
  - negative integers?

repeat('Hello', 3)

=>

Hello
Hello
Hello

Data Structures
-----------------------
Take str and int
No return value needed based on spec


Algorithm
-----------------------
- loop n times
  - puts the string in each loop

- instead of using .times, could have used a for loop for i in 1..num
  - would still need to check num is a positive int for loop to work
    - if you give a negaitve int in the range, the loop just doesn't run, but if you give it
      a string, you get an ArgumentError for a bad value for range

- could have used a while loop and a counter

- could have used loop with a counter

=end

def repeat(str, num)
  if num.is_a?(Integer) && num > 0
    num.times {puts str}
  else
    puts "The second argument must be a positive integer."
  end 
end   

repeat('Hello', 3)
repeat('Hi', 0)
repeat([1, 2], 4)
repeat('Howdy', 'test')

for i in 1 .. "str"
  puts 'hey there'
end
