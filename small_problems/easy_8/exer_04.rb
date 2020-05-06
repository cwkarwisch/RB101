=begin

Input: String
Output: Array

Explicit Req's:
Return a new array of all substrings
Order substrings by the position where they begin in the original string, then by length (shortest first)

Impliciut Req's
Empty string return empty array?
Spaces?
Validate?

- Starting at the beginning of a given string, iterate through that string and
  add every substring from length 1 up to the full length of the original string
  to the array
- Move to the next character and repeat

Algorithm
-------
SET empty array

- Starting at the beginning of the array, add all possible substrings from that position
  to the array
- Move to the next character, and add all possible substrings from that position to the
  array
- Repeat until we are starting from the last character in the string

RETURN array

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

def substrings(string)
  array = []
  length = string.length
  starting_index = 0
  loop do
    array += substrings_at_start(string.slice(starting_index, length))
    starting_index += 1
    break if starting_index == length
  end
  array
end

puts substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]