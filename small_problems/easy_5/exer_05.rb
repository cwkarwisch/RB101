=begin

Understand the Problem
-----------
Only one space, even if we've replaced/deleted multiple non-allphabetic chars

Easy to map once to replace all non alphabetic characters with spaces
Then need to map again to replace any multiple spaces
  - can do by splitting on spaces and then joining back with a single space
  - need to address a trailing or leading space that should be there because we replaced
    a char there. Join wouldn't catch those.....

  - Could use a regex to replace multiple spaces with a single space

Examples/Test Cases
-----------
Empty string
  - will presume to return an empty string
  - string with two spaces?
  - string with one space? presume return one space

Validate for non-string input?

Data Structures
-----------
In: String
Out: String

Algorithm
-----------
Set clean_str = empty string
set clean_str equal to a map of the input string where we replace any non-alphabetic chars
REPLACE any multiple spaces in the clean string with a single space
RETURN the clean string

=end

def is_alpha?(str)
  /[[:alpha:]]/.match?(str)
end

def cleanup(string)
  clean_str = ''
  string.each_char do |char|
    is_alpha?(char) ? clean_str << char : clean_str << " "
  end
  clean_str = clean_str.gsub(/[[:space:]]+/, ' ')
end

ALPHABET = ('a'..'z').to_a

def cleanup2(string)
  clean_chars = []
  string.chars.each do |char|
    if ALPHABET.include?(char)
      clean_chars << char
    else
      clean_chars << ' ' unless clean_chars[-1] == ' '
    end
  end
  clean_chars.join
end

puts "tests"
puts "---------"

puts cleanup2("---what's my +*& line?") == ' what s my line '
