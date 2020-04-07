=begin

Understand the Problem
----------
Input: two strings, of different lengths
Output: a concatenated string
  - shorter str + longer str + shorter str

Examples/Test Cases
----------
Handle empty string
Validate string input?


Data Structures
----------
In: two strings
Out: a string

Should be able to work with just the strings

Algorithm
----------
START

IF the length of string1 is longer than str2
  - RETURN str2 + str1 + str2
ELSE
  -RETURN str1 + str2 + str1

END

=end

def short_long_short(str1, str2)
  str1.length > str2.length ? str2 + str1 + str2 : str1 + str2 + str1
end  

puts "test"
puts "--------------"

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"