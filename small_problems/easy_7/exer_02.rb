=begin

Problem
--------
Input: String
Output: Hash

Explicit Req's
---
Hash contains a count of uppercase chars, lowercase chars, and chars that are neither


Implicit Req's
---
Include spaces, they count as neither
Empty sting returns a hash where the value of each key is 0

Go through each character in the input string and determine if it is an
uppercase char, a lowercase char, or neither

As you go through each character, update the count of each category in the hash

Algorithm
-----
SET a hash with three keys for each of our categories
ITERATE through each character in the string
  - For each character, determine the following....
    - If it is a lc char
      - If so, update the lc key in the hash
    - If it is an up char
      - Update the up key in the hash
    - If it is neither
      - Update the neither key in the hash
  - Repeat for every character in the string
RETURN the hash

=end

def letter_case_count(string)
  hash = {
    lowercase: 0,
    uppercase: 0,
    neither: 0
   }

   counter = 0
   until counter == string.length
    if string[counter].match?(/[a-z]/)
      hash[:lowercase] += 1
    elsif string[counter].match?(/[A-Z]/)
      hash[:uppercase] += 1
    else
      hash[:neither] += 1
    end
    counter += 1
  end

  hash
end

puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
