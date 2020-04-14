=begin

Understand the Problem
----------
In: string
Out: int

Num will be positive or zero

Will want to take mod 10, move it into the string
Then divide by 10 and keep going until we've converted each char
We'll know we've reached the end when dividing by 10 == 0

Examples/Test Cases
----------
Validate for non-int inputs?

Data Structures
----------
In: int
Out: string

Use modular arithmetic on number
Use a hash for lookup of the int to char conversion
An arry would be helpful, but should be able to accomplish with only string methods
  - can use String#insert to always insert at the beginning
  - syntax is String#insert(index, other_str)
  - use String#insert(0, other_str) to keep inserting at beginning

Algorithm
----------
CREATE hash with conversions

SET string = empty string
Use a do...while loop to capture a 0 input
ITERATE through the number until number mod 10 == 0
  -char = string % 10
  -insert char's string value into the beginning of the empty string
  -divide number by 10

RETURN string
=end

STRING_TO_INT = {
  0 => '0',
  1 => '1',
  2 => '2',
  3 => '3',
  4 => '4',
  5 => '5',
  6 => '6',
  7 => '7',
  8 => '8',
  9 => '9',
}

def integer_to_string(number)
  string = ''

  digit = number % 10
  string.insert(0, STRING_TO_INT[digit])

  until number / 10 == 0
    number = number / 10
    digit = number % 10
    string.insert(0, STRING_TO_INT[digit])
  end

  string
end 

puts "tests"
puts "-----"

puts integer_to_string(4321) == '4321'
puts integer_to_string(13) 
puts integer_to_string(0) == '0'
puts integer_to_string(5000) == '5000'