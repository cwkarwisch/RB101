=begin

Understand the Problem
-------------
In: array of string
Out: array of strings

The tests show that we're not deleting the array elements themselves, but deleting the vowels
from the individual strings

Iterate through each element in the array and call String#delete on that element
Iterate with map

Examples/Test Cases
-------------
Empty array returns empty array?
Array with empty strings will return array with empty strings

Validate for array input?
Validate for array with only strings?

Data Structures
-------------
arrays
strings


Algorithm
-------------
SET empty array to hold revised words
MAP the input array, calling delete on each word
RETURN the mapped array

=end

def remove_vowels(array)
  array.map{|word| word.delete("aeiouAEIOU")}
end

puts "tests"
puts "---------"

puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']