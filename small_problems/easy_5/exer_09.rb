=begin

Understand the Problem
----------
In: string
Out: new string

Output string collapes all duplicate, consecutive characters

Examples/Test Cases
----------
Empty string returns empty string
Validate for non-string input?
be able to handle numbers as well?
What about punctuation?

Data Structures
----------
In: string
Out: string

We can split the inpit string into an array of chars
Create a new, empty array <- probably not necessary, can run each_char on a string
Shovel in each char from the string unless the last element in the array matches the current char

Algorithm
----------
SET empty array
ITERATE through string, shoveling chars into the array, unless current char matches the last char in the array
JOIN the chars into the array together
RETURN the new string

=end

def crunch(string)
  char_array = []
  string.each_char{ |char| char_array << char unless char_array.last == char}
  char_array.join
end

puts "tests"
puts "-------"

puts crunch('ddaaiillyy ddoouubbllee') == 'daily double'
puts crunch('4444abcabccba') == '4abcabcba'
puts crunch('ggggggggggggggg') == 'g'
puts crunch('a') == 'a'
puts crunch('') == ''
