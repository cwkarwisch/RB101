=begin

Understand the Problem
-----------
Input: integer
Output: bool


Examples/Test Cases
-----------
Validate integer inpit?
Check for nil input?
how to handle negative integers?

Data Structures
-----------
Input: integer
convert to string and treat like a typical palindrome
Could use modular arithmetic on the number itself, but seems unnecessarily complicated

Algorithm
-----------
START

CONVERT input int to a string
COMPARE input string to a reversed copy of the input string

END

=end

def palindromic_number?(int)
  int.to_s == int.to_s.reverse
end 

puts "tests"
puts "-----------"

puts palindromic_number?(34543) == true
puts palindromic_number?(123210) == false
puts palindromic_number?(22) == true
puts palindromic_number?(5) == true

puts palindromic_number?(050) == false

# When ruby converts a number beginning with a 0 to a string, it converts
# the number from an octal to a base 10 (decimal) number.

# For our method to work, we would need to check whether our input begins
# with a zero. If so, we would need to convert the number to a string that
# preserves the number as an octal.

# When we call Integer#to_s on a number, ruby assumes a default value of
# base = 10. We can change that default by calling Integer#to_s(8). 
# That conversion alone, however, does not preserve the leading 0s.

# When converting to a string, we can use string formatting to add leading 0s,
# but we need some way to know how many were there in the first place, 
# besides just looking at the input and seeing how many there are.  