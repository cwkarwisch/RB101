=begin

Input: integer
Output: integer

Explicit Reqs
Return the difference between the square of the sums of the first n positive ints and
the sum of the squares of the first n positive ints

Implicit Reqs
Validate for positive integer input?

Algorithm
Calculate Square Sum
Calculate Sum Square
Return the difference

Initialize variable for sum_to_be_squared to 0

Iterate between 1 and n
  - keep a running sum (sum_to_be_squared)
  - add each integer to the running sum
Square the running sum and assign to appr variable

Initialize variable for sum_of_squares

Iterate between 1 and n
  - keep a separate running sum (sum_of_squares)
  - square each integer and add to the running sum

Calculate difference between square sum and sum square
Return the difference

=end

def sum_square_difference(n)
  sum_to_be_squared = 0
  sum_of_squares = 0
  1.upto(n) do |num|
    sum_to_be_squared += num
    sum_of_squares += (num ** 2)
  end
  square_of_sums = sum_to_be_squared ** 2

  square_of_sums - sum_of_squares
end

sum_square_difference(5)

puts sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
puts sum_square_difference(10) == 2640
puts sum_square_difference(1) == 0
puts sum_square_difference(100) == 25164150






