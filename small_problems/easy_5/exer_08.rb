=begin

Understand the Problem
---------
Think we will have to hard code into some kind of data structure the conversion
of each number to its english counterpart

Note though that we don't return the english words
In: array of numbers
Out: array of numbers

Take input array, which is in numeric order, and map it to a new array where we replace the
  numbers with their english word counterparts
Then we sort the array of english word counterparts
Then we replace the english words with the numbers again and return the now sorted array

Examples/Test Cases
---------

Data Structures
---------
In: array of numbers
Out: array of numbers

Hash as look up table for converison of number to english string

Algorithm
---------
SET hash as a constant where keys are numbers and values are english words

SET array of words equal to a map of the input array where we replace each number
  in the array by looking up the corresponding key in the hash

SORT the array of words

MAP the array of words to an array of numbers (try to use one hash, but can use two if no method will do the trick)

RETURN the array of numbers

=end

NUMBERS_TO_WORDS = {
  0 => 'zero',
  1 => 'one',
  2 => 'two',
  3 => 'three',
  4 => 'four',
  5 => 'five',
  6 => 'six',
  7 => 'seven',
  8 => 'eight',
  9 => 'nine',
  10 => 'ten',
  11 => 'eleven',
  12 => 'twelve',
  13 => 'thirteen',
  14 => 'fourteen',
  15 => 'fifteen',
  16 => 'sixteen',
  17 => 'seventeen',
  18 => 'eighteen',
  19 => 'nineteen'
}

def alphabetic_number_sort(array_of_numbers)
  array_of_words = array_of_numbers.map { |num| NUMBERS_TO_WORDS[num]}
  array_of_words.sort!
  sorted_array_of_numbers = array_of_words.map{ |word| NUMBERS_TO_WORDS.key(word)}
end

puts "tests"
puts "---------"

puts alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]