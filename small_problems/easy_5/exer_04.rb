=begin

Understand the Problem
----------
In: string
Out: string

Examples/Test Cases
----------
You may assume that every word contains at least one letter,
and that the string will always contain at least one word.

You may also assume that each string contains nothing but words and spaces

Don't need to deal with punctuation.
Don't need to deal with empty string.
Don't need to deal with non-str inputs.

Data Structures
----------
In: string
Out: string

TO process gthe changes, we should move the individual words into an array of words
Then we can map that array, swapping the first and last chars in each word

Algorithm
----------
SPLIT the input string where there are spaces
MAP that array onto a new array
  -As we iterate through each word, swap element[0] and elem[length -1]
JOIN the mapped array with spaces between the words

=end

def swap(sentence)
  array = sentence.split(" ")
  array.map! do |word|
    first_letter = word[0]
    word[0] = word[word.length - 1]
    word[word.length - 1] = first_letter
    word
  end
  array.join(" ")
end

puts "tests"
puts "---------"

puts swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
puts swap('Abcde') == 'ebcdA'
puts swap('a') == 'a'
