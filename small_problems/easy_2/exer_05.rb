=begin

Write a program that will ask for user's name. The program will then greet the user. If the user writes "name!" then the computer yells back to the user.

Examples

What is your name? Bob
Hello Bob.
What is your name? Bob!
HELLO BOB. WHY ARE WE SCREAMING?


Understand the Problem
------------
Input: String from the user
Output: string message

The key is checking whether the last character in the user's inpit is an !
What we print back is based on the presence of the appended !

Examples/Test Cases
------------
Assume no validation of input

Data Structures
------------
Take in the string
Use .chars to get the individiual characters into an array


Algorithm
------------
GET user name
SET user name

Split user name into individual chars
IF last char (arr.length -1) is an !
  print funny message
ELSE
  print regular greeting

=end

def std_greeting(name)
  puts "Hello #{name}."
end 


def funny_greeting(name)
  puts "HELLO #{name.upcase}. WHY ARE WE SCREAMING?"
end 


print "What is your name? "
name = gets.chomp
array = name.chars

if array[array.length - 1] == '!'
  unexcited_name = array[0..(array.length - 2)].join("")
  funny_greeting(unexcited_name)
else
  std_greeting(name)
end 