=begin

Problem
--------
Input: String
Output: String

Explicit Req's:
Return a new string
every lc char becomes uc
every uc char becomes lc
all other chars unchanged

Implicit Req's
Empty string returns empty string?
Validate for non-string input?
Preserve spaces and other non-alpha chars

Iterate over every letter in the string and swap the case

Algorithm
---------
SET empty string
BREAK the string into individual chars
ITERATE over each character
  - IF the char is uc, turn it into lc
  - IF the char is lc, turn ut into up
  - IF neither, leave it alone
JOIN the characters back together

=end

UPPERCASE_CHARS = ('A'..'Z').to_a
LOWERCASE_CHARS = ('a'..'z').to_a

def swapcase(string)
  swapped_chars = string.chars.map do |char|
    if UPPERCASE_CHARS.include?(char)
      char.downcase
    elsif LOWERCASE_CHARS.include?(char)
      char.upcase
    else
      char
    end
  end
  swapped_chars.join('')
end


puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
puts swapcase('') == ''