=begin

Understand the Problem
----------
In: String
Out: number

Would be easy to split the chars of the string into an array
  - does String#chars capture the spaces?
    - tested in irb, yes
then map the array swapping out the elements for the ascii values
then reduce the array


Examples/Test Cases
----------
Validate for non string input?
Empty string should be 0

What about spaces?
A space has an ASCII value of 32
Will need to confirm that is how the examples work

Data Structures
----------
In: string
Out: int

Will move characters from the str into an array

Algorithm
----------
SET array as the collection of all characters in the string
MAP the elements of the array to a new array containing the ascii values of all characters
REDUCE the mapped array to sum up the ascii values

RETURN the sum of the ascii values

=end

def ascii_value(string)
  char_array = string.chars
  ascii_values = char_array.map { |char| char.ord }
  ascii_values.reduce(0, :+)
end

puts "tests"
puts "-----------"

puts ascii_value('Four score') == 984
puts ascii_value('Launch School') == 1251
puts ascii_value('a') == 97
puts ascii_value('') == 0