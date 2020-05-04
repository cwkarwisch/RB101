=begin

Problem
------
Input: string
Output: string

Explicit Req's:
First char and every alternating char is capitalized
The remaining chars are lc
Ignore spaces and punctuation in terms of capitalizing, but they count for positioning


Implicit Req's:
Empty string return empty string?
Vlidate for non-string input?

Keep track of index of every character in the string
Capitalize any letter that has an even index
and lowercase any letter that has an odd index

Algorithm
------
SET empty string
ITERATE over every character in the string
  - IF the character has an even-numbered index and is a letter, make it uppercase
  - IF the character has an odd-numbered index and is a letter, make it lowercase
  - IF the character is not a letter, don't modify it
RETURN the new string

=end

LETTERS = ('a'..'z').to_a + ('A'..'Z').to_a

def staggered_case(string)
  staggered_string = ''
  chars = string.chars
  chars.each_with_index do |char, index|
    if index.even? && LETTERS.include?(char)
      staggered_string << char.upcase
    elsif index.odd? && LETTERS.include?(char)
      staggered_string << char.downcase
    else
      staggered_string << char
    end
  end
  staggered_string
end

puts staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
