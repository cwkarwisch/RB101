=begin

Understand the Problem
----------
Input: integer - year
Output: string - name of applicable century'

new centuries begin in years ending in 01
Use st, nd, rd, or th as appr for the century name

What are endings
01 - st
02 - nd
03 - rd
04- 20 - th
21 - st
22 - nd
23 - rd
24-30 - th

11, 12, 13 don't fit the pattern

Two problems to solve: 
  1) what century
    - take digits except last 2 and increment by 1
    - to get rid of last 2 digits, divide by 100
      - then increment that number by 1 and convert to a string
        - this works, except for the last year of a century (e.g., 2000)
        - to control for this, before we increment need to check the year % 100
        - if year % 100 equals 0, then we don't increment by 1
        - otherwise, we incremement by 1

  2) what is ending
    - good use case for modular arithmetic, but have to deal with 11-13 exceptions
    - year mod 100 will give us the last two digits

Examples/Test Cases
----------
Handle inputs that are strings?
Negative numbers?

Data Structures
----------
In: Int
Out: string

Algorithm
----------
START

what_century_number
Set century = year divided by 100
IF year % 100 = 0
  RETURN century converted to a string
ELSE
  century = century + 1
  RETURN century converted to a string

number_ending 
IF year % 100 == 11, 12 or 13
  ending = 'th'
ELSE
  IF year % 10 = 0, 4, 5, 6, 7, 8, or 9
    - ending = 'th'
  IF year % 10 = 1
    - ending = 'st'
  IF year % 10 == 2
    - ending = 'nd'
  IF year % 10 == 3
    - ending = 'rd'

RETURN century_string + ending

END

=end


def century(year)
  century = year / 100
  if year % 100 == 0
    century_string = century.to_s
  else   
    century = century + 1
    century_string = century.to_s
  end 

  ending = ''
  if century % 100 == 11 || century % 100 == 12 || century % 100 == 13
    ending << 'th'
  else
    if century % 10 == 1
      ending << 'st'
    elsif century % 10 == 2
      ending << 'nd'
    elsif century % 10 == 3
      ending << 'rd'
    else
      ending << 'th'
    end
  end

  century_string + ending
end 

puts "tests"
puts "------------"

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'
   