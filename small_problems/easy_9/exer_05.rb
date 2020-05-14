=begin

Input: string
Output: boolean

Explicit Reqs:
Returns true if all alpha characters are uppercase
False otherwise
Ignore non slphs characters

Implicit Reqs
Empty string should return true
Validate for non-string input?
  - return nil

Look througyh every character in the string
  - If the character is alphabetic
    - IF uppercase
      - go to next character
    - IF NOT uppercase
      return false
  - IF the character is non-alphavetic, go to the next character

DEfault: returning true

=end

LC_ALPHABETIC_CHARACTERS = ('a'..'z').to_a


def all_alpha_chars_uppercase?(string)
  return nil unless string.class == String

  string.each_char do |char|
    if LC_ALPHABETIC_CHARACTERS.include?(char)
      return false
    end
  end

  true
end

puts all_alpha_chars_uppercase?('t') == false
puts all_alpha_chars_uppercase?('T') == true
puts all_alpha_chars_uppercase?('Four Score') == false
puts all_alpha_chars_uppercase?('FOUR SCORE') == true
puts all_alpha_chars_uppercase?('4SCORE!') == true
puts all_alpha_chars_uppercase?('') == true
puts all_alpha_chars_uppercase?(45) == nil