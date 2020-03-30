=begin

Write a method that takes one argument, a positive integer, and returns a string of alternating
1s and 0s, always starting with 1. The length of the string should match the given integer.

Examples:

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
The tests above should print true.

Understand the Problem
-----------------------
Input: One positive integer
Output: A string of 0s and 1s



Examples/Test Cases
----------------------
Need to check for input as only positive integer?


Data Structures
----------------------
Take in a positive integer
Output a string



Algorithm
----------------------
Start a loop with a counter at 1
if counter is odd, print a 1
if counter is even, print a 0
break if counter = the supplied positive integer
increment counter



=end 


def stringy(integer)
  string = ""
  counter = 1
  loop do
    string += '1' if counter.odd?
    string += '0' if counter.even?
    break if counter == integer
    counter += 1
  end 
  string
end


puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

def stringy2(integer, start = 1)
  string = ""
  counter = 1
  loop do
    string += '1' if counter.odd? && start == 1
    string += '0' if counter.even? && start == 1
    string += '0' if counter.odd? && start == 0
    string += '1' if counter.even? && start == 0
    break if counter == integer
    counter += 1
  end 
  string
end

puts stringy2(5)
puts stringy2(5, 0)

