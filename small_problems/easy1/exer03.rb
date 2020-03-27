=begin

Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

Examples:

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true


Understand the Problem
----------------------
Args: one, a positive int
Returns an aray


Examples/Test Cases
----------------------
What if we don't receive a numeric?


Data Structures
----------------------
Input: numeric
Output: array


Algorithm
----------------------
- convert to string
- place chars of string into an array (Array#chars)
- convert strings in the array to integers

OR

- create empty arrray
- use modular arithmetic to place each digit in array from left to right
  - take the number mod 10, and unshift that number into the array
  - repeat until we've consumed all the digits
    - we've consumed all the digits when num is < 10 and we've taken its mod 10 once


=end

def digit_list(number)
  number.to_s.chars.map {|str| str.to_i}
end


puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

puts "---------------------------------"

def digit_list2(number)
  array = []
  loop do
    array.unshift(number % 10)
    break if number < 10
    number = number / 10
  end
  array
end

puts digit_list2(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list2(7) == [7]                     # => true
puts digit_list2(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list2(444) == [4, 4, 4]             # => true
