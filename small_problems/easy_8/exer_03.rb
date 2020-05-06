=begin

Input: String
Output: Array of Strings

Explicit Req's
Return list of all substrings, starting from beginning of string
Arranged from shortest to longest

Implicit Reqs
Emptry string return empty array?
Validate for non-string types?
Return a new array object?
Don't stop if string includes spaces?

Starting with a length of 1, list out all the substrings in a given substring
until we reach a length that is equal to the length of the original substring

Algorithm
---------
SET empty array
ITERATE through the original string
  - starting with length 1, add substring of length 1 to the array
  - increase size of substring length on each iteration
RETURN the new array

=end

def substrings_at_start(string)
  array = []
  sub_string = ""
  index = 0
  until index == string.length
    sub_string += string[index]
    array << sub_string
    index += 1
  end
  array
end

puts substrings_at_start('abc') == ['a', 'ab', 'abc']
puts substrings_at_start('a') == ['a']
puts substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']