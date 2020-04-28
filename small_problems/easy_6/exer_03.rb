=begin

Understand the Problem
-----------
In: number
Out: number

Need to iterate through the fibonacci series and stop when we reach the first number in the series that has the number
of digits equal to the input.

If that series is stored in an array, we can access its index in the array, add 1, and return that index as our output.

Write a recursive fibonacci series function
Run that method in a loop until we generate the last element in the array that has sufficient digits to meet out test

Determine number of digits in element in series...
Divisor = 10 to the power of (n-1)
If digits == 2, divisor is 10, we know we have two digits when the number / 10 is greater than or equal to 1 but less than 10
If digits == 3, divisor is 100, then we know we have three digits when number / 100 is greater than or equal to 1 but less than 10

Examples/Test Cases
-----------
Input always >= 2

Validate for non int input?

Data Structures
-----------
Numbers
Array of numbers in the fibonacci series

Algorithm
-----------
Fibonacci method

As a recursive method, need to address the base case that returns at the bottom of the stack
IF input == 1, return 1



=end
FIBONACCI = Hash.new {|hash, key| hash[key] = key < 2 ? key : hash[key - 1] + hash[key -2 ]}

def fibonacci(element)
  fibonacci_hash = Hash.new {|hash, key| hash[key] = key < 2 ? key : hash[key - 1] + hash[key - 2]}
  fibonacci_hash[element]
end

def fibonacci_recursive(element)
  if element == 1 || element == 2
    return 1
  else
    return fibonacci(element - 1) + fibonacci(element - 2)
  end
end

def fibonacci_brute_force(element)
  return 1 if element <= 2
  first = 1
  second = 1
  number = 0
  index = 2
  while index < element
    number = first + second
    first = second
    second = number
    index += 1
  end
  number
end

# p fibonacci(30)
# p fibonacci_recursive(30)
# p fibonacci_brute_force(30)

=begin
def build_fibonacci_array(element)
  array = []
  element.times {|num| array << (fibonacci(num + 1))}
  array
end
=end

def find_fibonacci_index_by_length(length)
  divisor = 10 ** (length - 1)
  counter = 1
  while (FIBONACCI[counter] / divisor) < 1
  #while (fibonacci(counter) / divisor) < 1
    counter += 1
  end
  counter
end


puts "tests"
puts "--------"

# puts find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
# puts find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
# puts find_fibonacci_index_by_length(10) == 45
# puts find_fibonacci_index_by_length(100) == 476
# puts find_fibonacci_index_by_length(1000) == 4782
puts find_fibonacci_index_by_length(10000) == 47847
