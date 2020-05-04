=begin

Problem
----
Input: string
Output: string

Explicit Req's
Returns the next to last word
words are a sequence of non-blank chars


Implicit Req's
Return a new string?
Validate for non-string input?

Count the number of words in the string, and return the second to last one

Algorithm
-------
SPLIT the string into words
COUNT the number of words in the string
RETRIEVE the second to last word (the word at length - 2)
RETURN the second to last word

=end

def penultimate(string)
  words = string.split(" ")
  count = words.length
  words[count - 2]
end

puts penultimate('last word') == 'last'
puts penultimate('Launch School is great!') == 'is'
