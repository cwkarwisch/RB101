=begin

Write a method that takes one integer argument, which may be positive, negative, or zero. 
This method returns true if the number's absolute value is odd. You may assume that the argument 
is a valid integer value.

Examples:

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true
Keep in mind that you're not allowed to use #odd? or #even? in your solution.

Understand the Problem
-----------------------

Args: one int

Examples/Test Cases
----------------------
If we use modular arithmetic, need to deal with 0

Data Structures
----------------------
Recieve an int
Return a bool

Algorithm 
-----------------------
- if number is 0, return false
- if number mod 2 equals 0, return false
  - else, return true

=end

def is_odd?(int)
  if int % 2 == 0
    return false
  else
    return true
  end 
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

# Further Exploration

# The LS solution could be rewritten, if you weren't sure the % was a modulus or a remainder 
# operator to test for even numbers first, since an even number, even a negative one, mod 2
# will still equal 0 even if you use the remainder operator.  

# You could also take the absolute value of each int, converting negative to positive numbers.

def is_odd2?(int)
  if int.remainder(2) == 0
    return false
  else
    return true
  end 
end

puts "----------------------"


puts is_odd2?(2)    # => false
puts is_odd2?(5)    # => true
puts is_odd2?(-17)  # => true
puts is_odd2?(-8)   # => false
puts is_odd2?(0)    # => false
puts is_odd2?(7)    # => true