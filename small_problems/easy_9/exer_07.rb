=begin

Input: String
Output: String

Explicit Req's


Implicit Req's
Return a new string or modify the original string?
Assume names in input string will be separated by exactly one space?
Empty string?
Vlaidate for non-string input?
Sr.? Jr.? III?

Algorithm

Split string into an array of strings
Reverse order
Join together with a comma and space

=end

def swap_name(name)
  name_array = name.split(" ")
  name_array.reverse!
  name_array.join(", ")
end

puts swap_name('Joe Roberts') == 'Roberts, Joe'
