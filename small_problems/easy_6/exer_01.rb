=begin

Understand the Problem
------------
In: number
Out: string

Need to take in the number and be able to extract the degrees, minutes, and seconds

Can obtain the degrees by calling Numeric#floor on the input
Then subtract the degrees from the input and we have the partial degree that needs to be converted
to minutes and seconds.

TO get the minutes, multiply the decimal by 60.
Then, the minutes will be the floor of that product.
Then, we take the resulting decimal from the product, multiply it by 60 again, round it,
and those are the seconds.

Examples/Test Cases
------------
Allow inputs greater than 360 degrees?
Validate for non numeric input?

Data Structures
------------
Numbers
Will use Kernel%format to format the output string

Algorithm
------------


=end

MINUTES_IN_DEGREE = 60
SECONDS_IN_MINUTE = 60
DEGREE = "\xC2\xB0"

def dms(angle)
  degrees = angle.floor
  decimal = angle - angle.floor
  minutes = (decimal * MINUTES_IN_DEGREE).floor
  minutes_with_decimal = decimal * MINUTES_IN_DEGREE
  seconds = ((minutes_with_decimal - minutes) * SECONDS_IN_MINUTE).round(2)
  format(%(%d#{DEGREE}%02d'%02d"), degrees, minutes, seconds)
end

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")