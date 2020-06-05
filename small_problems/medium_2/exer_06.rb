=begin

Input: three integers
Output: symbol

Explicit Reqs
Right - one angle is 90
acute - all 3 angles less than 90
obtuse - one angle greater than 90
invalid - sum of 3 angles == 180 AND all angles > 0

Algorithm

- Calculate sum of all angles
  - if sum != 180 OR any angle <= 0
    - return :invaliod
- If any angle == 90
  - return : right
- if any agle > 90
  - return obtuse
- else
  - return acute


=end

def triangle(*angles)
  if angles.sum != 180 || angles[0] <= 0 || angles[1] <= 0 || angles[2] <= 0 || angles.size != 3
    return :invalid
  elsif angles[0] == 90 || angles[1] == 90 || angles[2] == 90
    return :right
  elsif angles[0] > 90 || angles[1] > 90 || angles[2] > 90
    return :obtuse
  else
    return :acute
  end
end

puts triangle(60, 70, 50) == :acute
puts triangle(30, 90, 60) == :right
puts triangle(120, 50, 10) == :obtuse
puts triangle(0, 90, 90) == :invalid
puts triangle(50, 50, 50) == :invalid
