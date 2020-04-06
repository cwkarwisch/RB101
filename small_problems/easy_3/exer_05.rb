=begin

Understand the Problem
----------
Input: number
Output: the square of that number

Examples/Test Cases
----------
square(5) == 25
square(-8) == 64

Method should handle 0 and negative numbers fine
Validate for numeric input?

Data Structures
----------
Just numerics

Algorithm
----------
num * num

=end

def multiply(arg1, arg2)
  arg1 * arg2
end 

def square(num)
  multiply(num, num)
end 

puts square(5) == 25
puts square(-8) == 64

# doesn't handle negative powers
def power_to_the_n(num, power)
  if power == 0
    1
  elsif power == 1
    num
  else   
    counter = 2
    total = multiply(num, num)
    while counter < power
      total = multiply(total, num)
      counter += 1
    end
    total   
  end 
end 

puts power_to_the_n(5, 0)
puts power_to_the_n(5, 1)
puts power_to_the_n(5, 2)
puts power_to_the_n(5, 3)
puts power_to_the_n(5, 4)
puts power_to_the_n(5, 5)