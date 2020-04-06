=begin

Understand the Problem
------------
Input: two booleans
Ouput: a single boolean

Our input is either two booleans, or two expressions that evaluate to bools
Only return true if one of the args is true, else false


Examples/Test Cases
------------
xor?(5.even?, 4.even?) == true
xor?(5.odd?, 4.odd?) == true
xor?(5.odd?, 4.even?) == false
xor?(5.even?, 4.odd?) == false


Data Structures
------------
return appr bool after working through logic

Algorithm
------------
START
IF arg1 == true AND arg2 == false
  reutrn true
IF arg1 == false AND arg1 == true
  return true
ELSE 
  return false


END

=end

def xor?(bool1, bool2)
  if (bool1 == true && bool2 == false) || (bool1 == false && bool2 == true)
    true
  else
    false
  end
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false