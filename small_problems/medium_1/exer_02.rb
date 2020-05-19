=begin

Input: Integer
Output: Integer

Explicit Reqs:
Takes two arguments
  1) Integer
  2) n - last n digits to rotate
Take the digit that is n spaces from the end of the number
and move it to the end of the digit
n is always a positive int

Implicit Reqs
Input int is 0?
Inout int has less than n digits?
Non int input for first argument?

Algorithm

Split up integer into its component digits
Take the digit that is n spaces away from the end of the digit
Move that digit to the end of the array
Remove the blank space where the rotated digit was
Join the digits back together into a number

=end


def rotate_rightmost_digits(number, n)
  digits_array = number.digits.reverse
  un_rotated_array = digits_array[0..(-n - 1)]
  rotated_array = rotate_array(digits_array[(digits_array.length - n)..-1])
  (un_rotated_array + rotated_array).join("").to_i
end

def rotate_array(original_array)
  rotated_arr = original_array.clone
  elem_to_rotate = rotated_arr[0]
  rotated_arr.push(elem_to_rotate)
  rotated_arr.shift
  rotated_arr
end

puts rotate_rightmost_digits(735291, 1) == 735291
puts rotate_rightmost_digits(735291, 2) == 735219
puts rotate_rightmost_digits(735291, 3) == 735912
puts rotate_rightmost_digits(735291, 4) == 732915
puts rotate_rightmost_digits(735291, 5) == 752913
puts rotate_rightmost_digits(735291, 6) == 352917
