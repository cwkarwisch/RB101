=begin

Input: integer
Output: integer

Explicit Reqs

Can assume number greater than 1752

Implicit Reqs
Validate integer input?
Validate > 1752?

Algorithm

Possible valuyes between 0 and 12
Grab a calendar, look up the 13th of each month, and check what day of the week the 13th was
If it was a Friday, incremement our count of Friday the 13ths
Return the count of Friday the 13th

Pseudocode

count = 0
Iterate through January ... Decemeber
  - Check day of week of the 13th in that month
  - If Friday
    - incremement count by 1

Return count

=end

def friday_13th(year)
  count = 0
  months = (1..12).to_a
  months.each do |month|
    count += 1 if Time.new(year, month, 13).friday?
  end
  count
end

puts friday_13th(2015) == 3
puts friday_13th(1986) == 1
puts friday_13th(2019) == 2
