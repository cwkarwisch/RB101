=begin

Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

Examples:

puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
The tests above should print true.


Understand the Problem
----------------------
If the input is only an empty string, returns an empty string.
maintain capitalization.

Input: one string
Output: returns one string


Examples/Test Cases
---------------------
What to do with trailing white space at the end?
How to treat punctuation?
Variable length spaces between words?


Data Structures
--------------------
Take in a string as input
Convert string to array for manipulation
Convert back to a string for output


Algorithm
--------------------
- split the string into an array of words
- reverse the array of words
- join the array back into a string


=end

def reverse_sentence(string) 
  words_array = string.split(" ")
  words_array.reverse!
  reversed_string = words_array.join(" ")
end


puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'

