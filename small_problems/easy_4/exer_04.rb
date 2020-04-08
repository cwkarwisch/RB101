=begin

Understand the Problem
------------
Same as the previous except now we need different logic depending on whether
year in question is before 1752 or after 1752.

If before 1752, the logic is a simple test of year % 4 == 0


=end

def leap_year?(year)
  end_of_julian_calendar = 1751
  if year > end_of_julian_calendar
    return gregorian_leap_year?(year)
  else
    return julian_leap_year?(year)
  end
end 

def gregorian_leap_year?(year)
  if year % 400 == 0
    return true
  elsif year % 100 == 0
    return false
  else
    year % 4 == 0
  end
end

def julian_leap_year?(year)
  year % 4 == 0
end 

puts "tests"
puts "-------"

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == true
puts leap_year?(1) == false
puts leap_year?(100) == true
puts leap_year?(400) == true
