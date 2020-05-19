=begin

Input: digit
Output: digit

Explicit Reqs:
- Take number, and rotate it to the left
- Keep first digit in place, rotate remaining digits
- Keeo first two digits in place, rotate remaining digits
- Keep first 3 digits in place, rotate remaining digits
- Keep first 4 digits in place, rotate remaining digits

For a 6 digit number, 5 steps

Implicit Reqs
Validate for integer input?
Single digit number returns same number

Algorithm
Break number into component digits
Start a process with x steps where x == number of digits -1
  -On each cycle, rotate the digits to the left, leaving the first y digits in place
  - y starts at 0, but increments each time by 1
  - break when counter == number of digits - 1
Rejoin digits back into a number and return the number

=end

def max_rotation(number)
  digits = number.to_s.chars
  counter = 0
  rotated_num = number
  loop do
    break if counter == digits.length - 1
    rotated_num = rotate_rightmost_digits(rotated_num, digits.length - counter)
    counter += 1
  end
  rotated_num
end

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

puts max_rotation(735291) == 321579
puts max_rotation(3) == 3
puts max_rotation(35) == 53
puts max_rotation(105) == 15 # the leading zero gets dropped
puts max_rotation(8_703_529_146) == 7_321_609_845
