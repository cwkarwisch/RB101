=begin

Understand the Problem
------------
Should be able to contain the real logic in one function.
The sum of the return value of each function should sum to 1440
So if we run a given time through say after_midnight, the return value of
before_midnight should be 1440 - after_midnight(time)

If we assume the numbers are in valid format, we can easily extract the
numbers and create integers for the hours and minutes.

Then we can multiply the hours by 60, sum with the minutes and return the value.
Would need to use modular arithmetic to deal with the tens and ones places.
Or use an array that contains all values 0..59

If we use the array, would have to specifically deal with two digits numbers
that start with 0.

Examples/Test Cases
------------
Validate for hh:mm format?
Validate the numbers are in a range that make sense?

Data Structures
------------
In: string
Out: integer

Could use an array to store str to int conversion values


Algorithm
------------
SET first digit of hours equal to element 0 of input string
CONVERT char to int in lookup hash and multiply by 10

SET second digit of hours equal to element 1 of input string
CONVERT char to int in hash and add to first hours digit (that has been multiplied)

SET first digit of minutes equal to element 3 of input string
CONVERT char to int and multiply by 10

SET second digit of minutes equal to element 4 of input str
CONVERT char to int and add to first digit of minutes

Multiply hours by 60 and add to minutes

Implement other method as described above

=end

DIGITS = {
  '0' => 0,
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9,
}

MINUTES_IN_HOUR = 60
MINUTES_IN_DAY = 1440

def after_midnight(time_str)
  hours_tens = DIGITS[time_str[0]] * 10
  hours_ones = DIGITS[time_str[1]]
  hours = hours_tens + hours_ones

  minutes_tens = DIGITS[time_str[3]] * 10
  minutes_ones = DIGITS[time_str[4]]
  minutes = minutes_tens + minutes_ones

  minutes_after_midnight = (hours * MINUTES_IN_HOUR) + minutes
  minutes_after_midnight % MINUTES_IN_DAY
end

def before_midnight(time_str)
  minutes_after_midnight = after_midnight(time_str)
  minutes_before_midnight = MINUTES_IN_DAY - after_midnight(time_str)
  minutes_before_midnight % MINUTES_IN_DAY
end

puts "tests"
puts "-------"

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0