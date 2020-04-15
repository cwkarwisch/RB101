=begin

Understand the Problem
------------
Input: Integer
Output: String

There are 60 minutes in an hour and 1440 minutes in a day
Will need to be able to handle numbers > 1440 so that we appropriately wrap around
Will use modular arithmetic for the wrap around issue

Negative numbers move us back from 1440
Positive numbers move us forward
We could conceptualize midnight as 1440
Need a way to consistently translate the number of minutes into the hh:mm format
  - ideally, without hardcoding all 1440 possibilities

Anything between 0-59 hh == 00
60 - 119 hh == 01
Seems like we use modular arithmetic with base 60 to determine minutes :mm
Use division by 60 to determine the hour :hh
Probably good use case for the div mod function

quotient, remainder = Integer.divmod(60)
  - here, quotient should be the hours
  - and remainder should be the number of minutes

    - but still need to deal with wrap around for the hours
    - keep calculating the quotient until it is a number between 0 and 23.
    - use do while loop to implement?

  Should work for positive numbers

  If negative number, get quotient and remainder, but subtract from 1440, rather than adding from 0

  We can store :hh and :mm in variables, but will probably need to use Kernel#format when it comes time to create the string
  Can we use format even when we're not printing something to the screen?

  Something like format("%{hh}:%{mm}", hh: hours, mm: minutes)
      also need to make it display to two digits

Examples/Test Cases
------------
Must work with any integer input
Validate for non-integer input?

Data Structures
------------
In: integer
Out: string

Algorithm
------------
SET quotient and remainder equal to Input.Divmod(60)
while quotient > 23
  SET Integer = Input / 1440 (MINUTES IN A DAY)
  SET quotient and remainder equal to Integer.divmod(60)
IF original input was positive or 0
  FORMAT the output string based on the quotient and remainder
ELSE
  - quotient = 23 - quotient
  - remainder = 60 - remainder
  FORMAT the output string based on the quotient and remainder

=end

MINUTES_IN_A_DAY = 1440

def time_of_day(minutes_from_midnight)
  hours, minutes = minutes_from_midnight.divmod(60)
  while hours > 23
    minutes_from_midnight %= MINUTES_IN_A_DAY
    hours, minutes = minutes_from_midnight.divmod(60)
  end

  if hours >= 0
    return format("%02d:%02d", hours, minutes)
  else
    # we add hours to 23 because hours will be a negative number
    hours = 24 + hours
    return format("%02d:%02d", hours, minutes)
  end
end

puts "tests"
puts "----------"

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

def time_of_day2(delta_minutes)
  delta_minutes =  delta_minutes % MINUTES_PER_DAY
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

puts time_of_day2(-3)