=begin

Algorithm
-------
ITERATE through every character in the string
  - IF character is a letter, keep track of whether that letter should be upcase/downcase
  - IF character is a letter and needs to be uppercase
    - uppercase the character
  - IF the character is a letter and needs to be lowercase,
    - lowercase the character
  - IF character is not a letter,
    - do not modify
RETURN the new string

=end

LETTERS = ('a'..'z').to_a + ('A'..'Z').to_a

def staggered_case(string)
  staggered_string = ''
  chars = string.chars
  needs_upcase = true
  chars.each do |char|
    if LETTERS.include?(char) && needs_upcase == true
      staggered_string << char.upcase
      needs_upcase = false
    elsif LETTERS.include?(char) && needs_upcase == false
      staggered_string << char.downcase
      needs_upcase = true
    else
      staggered_string << char
    end
  end
  staggered_string
end

puts staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'