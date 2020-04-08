=begin

Understand the Problem
------------
Leap year if year % 4 == 0
  Except if year % 100 == 0, it is not a leap year
    UNLESS year % 400 == 0, in which case it is in fact a leap year

Input: integer
Output: bool



Examples/Test Cases
------------
Validate we have a positive int?
Validate we recieved a number?


Data Structures
------------
In: number
Can perform modular arithmetic on the number, no need for other DSs
Out: bool based on logic


Algorithm
------------
IF year % 4 != 0
  - RETURN false
ELSE
  - IF year % 100 == 0
    - RETURN  false UNLESS year % 400 == 0
  ELSE
    - RETURN true  

=end

def leap_year?(year)
  if year % 4 != 0
    return false
  elsif year % 100 == 0
    return false unless year % 400 == 0
    return true if year % 400 == 0
  else
    return true
  end
end

puts "tests"
puts "-------------------"

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true
