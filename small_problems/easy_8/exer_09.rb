=begin

Problem
------
Input: Number
Output: Number

Explicit Req's
Takes in positive integer
Returns number with its digits reversed

Implicit Reqs
No leading zeroes in return value
Numbers are immutable in ruby so we are returning a new object
Ignore inputs with leading zeroes
Validate for non positive ints?

Convert the numbers to their string equivalents, reverse the string, then re-convert to an integer

=end

def reversed_number(number)
  number.to_s.reverse.to_i
end

puts reversed_number(12345) == 54321
puts reversed_number(12213) == 31221
puts reversed_number(456) == 654
puts reversed_number(12000) == 21 # No leading zeros in return value!
puts reversed_number(12003) == 30021
puts reversed_number(1) == 1