=begin

Input: string
Output: hash

Explicit Reqs
Return hash with three entries


Implicit Reqs
Percentages are numbers - no % sign
Sometimes percentages are integers, but also have an example with floats
  - When to use floats?

Alogirthm

Count the number of characters in the string
Create an empty count for lc, up and other characters

Iterate through each character in the string
  - Check whether the character is lc, up or neither
    - Update the count for each type

After we've iterated through each word, calculate the percentage for each type

Populate the hash with the percentages

=end

LOWERCASE_CHARACTERS = ("a".."z").to_a
UPPERCASE_CHARACTERS = ("A".."Z").to_a

def letter_percentages(string)
  character_count = string.length.to_f
  lc_count = 0
  uc_count = 0
  other_count = 0

  string.chars.each do |char|
    if LOWERCASE_CHARACTERS.include?(char)
      lc_count += 1
    elsif UPPERCASE_CHARACTERS.include?(char)
      uc_count += 1
    else
      other_count += 1
    end
  end

  hash = {
    lowercase: (lc_count / character_count) * 100,
    uppercase: (uc_count / character_count) * 100,
    neither: (other_count / character_count) * 100
  }

end

puts letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
puts letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
