=begin

Problem
--------

Input: String
Output: String

Explicit Reqs
Returns a new string
Double every character

Implicit Req's
Double spaces and non-alphanumeric chars as well
Handle non string input.
Empty string retyrns empty string

Go through every character in the string, and add two copies of each character to the new string


Algorithm
----------
SET empty string

ITERATE through each character in the string
  - On each iteration, add two copies of the character to the new string

Return new string

=end

def repeater(string)
  double_chars = ''

  string.chars.each do |char|
    double_chars << char << char
  end

  double_chars
end

puts repeater('Hello') == "HHeelllloo"
puts repeater("Good job!") == "GGoooodd  jjoobb!!"
puts repeater('') == ''

