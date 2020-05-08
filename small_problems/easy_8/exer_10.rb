=begin

Problem
----------

Inout: String
Output: String

Explicit Req's
Retyurn the center character or characters
If odd string length, return one char
If even length, return two chars

Implicit Req's
Non-empty string
Validate for string input?
Spaces count
Assume other non-alphabetic chars count

Count the number of charsacters in the string
Count the exact midpoint if there are an odd number of characters
Count the index of the two middle characters if there are an even number of characters

If there are an odd number of characters, the midpoint will be length / 2 + 1 (due to integer division)
If there are an even number of characters, the midpoint will be at index length/2 and length/2 + 1

Algorithm
--------
DETERMINE length of input string

DETERMINE whether length is even or odd
  - IF odd, return the character at length / 2 + 1
  - IF even, return the characters at length /2 and length /2 + 1

=end

def center_of(string)
  if string.length.odd?
    string[(string.length / 2)]
  else
    string[(string.length / 2) - 1, 2]
  end
end

puts center_of('I love ruby') == 'e'
puts center_of('Launch School') == ' '
puts center_of('Launch') == 'un'
puts center_of('Launchschool') == 'hs'
puts center_of('x') == 'x'

