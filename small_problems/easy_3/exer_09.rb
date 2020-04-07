=begin

Understand the Problem
-----------
Input: string
Output: bool

Case insensitive
ignore non-alphanumeric chars


Examples/Test Cases
-----------
real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false


Data Structures
-----------
In: string
Out: bool

Can perform string opertations on the input and use logic to determine if
it is a palindrome. Could convert the string to an array but probably don't 
need to. 

Algorithm
-----------
START

DOWNCASE the input string
REMOVE all non-alphanumeric chars
SET a reversed copy of the string
COMPARE the two strings for equlaity

IF they are identical, return true
ELSE false

END

=end

def palindrome?(obj)
  obj == obj.reverse
end 

def real_palindrome?(str)
  array = str.downcase.chars
  array.filter! { |char| char.match?(/[[:alnum:]]/)}
  array == array.reverse
end 

def real_palindrome2?(str)
  str.downcase.delete("^a-z0-9") == str.downcase.delete("^a-z0-9").reverse
end 

def real_palindrome3?(str)
  str.downcase.gsub(/[^a-z0-9]/, "") ==  str.downcase.gsub(/[^a-z0-9]/, "").reverse
end 

puts "tests"
puts "------------"

puts real_palindrome3?('madam') == true
puts real_palindrome3?('Madam') == true           # (case does not matter)
puts real_palindrome3?("Madam, I'm Adam") == true # (only alphanumerics matter)
puts real_palindrome3?('356653') == true
puts real_palindrome3?('356a653') == true
puts real_palindrome3?('123ab321') == false