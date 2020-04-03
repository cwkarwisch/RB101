=begin

Write a program that will ask a user for an input of a word or multiple words 
and give back the number of characters. Spaces should not be counted as a character.

Understand the Problem
---------
Trick is dealing with the spaces
Input: string
Output: message to user with the count chars

Take input string, strip out all spaces, then apply .chars and print length
of the resulting array

Examples/Test Cases
---------
What if given an empty string or non-string?

Data Structures
---------
String
Could convert to an array, but may be able to do everything we need with str

Algorithm
---------
GET user string
SET user string

GSUB the user string replacing all spaces with an empty string

Convert string into an array of its chars

Print message with length of arr

=end 

print "Please write word or multiple words: "
string = gets.chomp

number_of_chars = string.gsub(' ', '').chars.length
puts "There are #{number_of_chars} characters in \"#{string}\"."