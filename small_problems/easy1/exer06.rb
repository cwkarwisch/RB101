=begin

Write a method that takes one argument, a string containing one or more words, and returns the 
given string with words that contain five or more characters reversed. Each string will consist
of only letters and spaces. Spaces should be included only when more than one word is present.

Examples:

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

Understand the Problem
-----------------------
Input: One string
Output: one string

Only reverse words with 5 or more chars
No spaces if only one word


Examples/Test Cases
-----------------------




Data Structures
-----------------------
Convert string into array for that each element can be checked for length and reversed if needed


Algorithm
------------------------
Split string into an array of words
Iterate through each word in the array
  - if the length of the word is 5 or more
    - reverse the word
    - otherwise, don't modify the word
Join the words back together into a string

=end

def reverse_words(string)
  words_array = string.split(" ")
  words_array.map! do |word| 
    if word.length >= 5 
      word.reverse
    else 
      word
    end 
  end
  words_array.join(" ")
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS