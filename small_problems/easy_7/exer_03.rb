=begin

Problem
-------
Input: String
Output: String

Explicit Req's:
Return a new string
Capitalize first letter of every word
All other letters lc

Implicit Req's
If first character of a word is non-alphabetic, we don't capitalize the first alphabetic
char in the word
Empty string returns empty string?
Validate for non-stirng input?

Iterate over every word in the sentence
For each word
  - capitalize the first char if it is alphabetic
  - lc all other chars in the word

Algorithm
-------
SET an empty string
BREAK the sentence up into individual words
ITERATE over each word in the sentence
  - capitalize the first char if it is alphabetic
  - lc all other chars in the word
  - add the word to the new string

RETURN the new string

=end

def word_cap(sentence)
  words = sentence.split(' ')
  words.map!{|word| word.capitalize}
  words.join(' ')
end

puts word_cap('four score and seven') == 'Four Score And Seven'
puts word_cap('the javaScript language') == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'