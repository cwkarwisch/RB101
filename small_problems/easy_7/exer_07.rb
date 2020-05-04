=begin

Input: array of integers
Output: display of the average

Explicit Req's
Assume non-empty array
Display result to 3 decimal places
Multiply all numbers together and divide by number of entries in the array

Go through each number in the array, multiplying each number together
Divide by the number of numbers multiplied together

Display result

Algorithm
-------
SET product
ITERATE through the array multiplying each number by the product of the previous numbers
DIVIDE by the number of elements in the array
DISPLAY the product to three decimal places

=end

def show_multiplicative_average(array)
  product = array.inject(:*)
  multiplicative_average = product / array.length.to_f
  puts "The result is " + format("%.3f", multiplicative_average)
end

show_multiplicative_average([3, 5])
#The result is 7.500

show_multiplicative_average([6])
#The result is 6.000

show_multiplicative_average([2, 5, 7, 11, 13, 17])
#The result is 28361.667