=begin

Understand the Problem
----------
In: string
Out: hash

Both the symbols and the values of the hash should be numbers
Will want to create the empty hash and set the default value to 0
We can then iterate through the string and as iterate through words, check the
hash to see if a key already exists for that word's length.
  - if not, create the key and increment the default value by 1
  - if the key already exists, increment the value by 1

Examples/Test Cases
----------
Empty string should return an empty hash
Validate for non-string input?

Data Structures
----------
Should be able to work only with string and hash
No, need to split words into an array we can iterate through

Algorithm
----------
SET empty hash with a default value of 0
ITERATE through the string
  - CHECK whether a key exists in the hash that is the number equal to the word's length
    - if so, increment the value by 1
    - if not, create the key and set the value equal to 1 (or incremement default value by 1)
RETURN the hash

=end

def word_sizes(sentence)
  hash = Hash.new(0)
  words = sentence.split(" ")
  words.each { |word| hash[word.length] += 1 }
  hash
end

puts "tests"
puts "-------"

puts word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
puts word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
puts word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
puts word_sizes('') == {}