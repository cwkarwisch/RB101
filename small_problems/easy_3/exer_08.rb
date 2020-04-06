=begin

Understand the Problem
-----------
Input: string
Output: boolean

case matters
punctuation and spaces matter

Examples/Test Cases
-----------
palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true

Data Structures
-----------
In: string
Can keep input as a string and compare it to a reversed version of itself


Algorithm
-----------
START

SET reversed_str = a reversed copy of the input string
COMPARE the reversed_str to the input string
  - use a case sensitive comparison operator

IF the strings are identicial, return true
ELSE return false

END

=end 

def palindrome?(str)
  reversed_str = str.reverse
  return true if reversed_str == str
  false
end 

def palindrome2?(arr)
  arr == arr.reverse
end 

def palindrome3?(obj)
  obj == obj.reverse
end 

puts "tests"
puts "--------"

puts palindrome?('madam') == true
puts palindrome?('Madam') == false          # (case matters)
puts palindrome?("madam i'm adam") == false # (all characters matter)
puts palindrome?('356653') == true


puts ""
puts "array tests"
puts "--------"

puts palindrome2?([1, 2, 2, 1]) == true
puts palindrome2?([3, 5, 3]) == true
puts palindrome2?([1, 1, 2]) == false