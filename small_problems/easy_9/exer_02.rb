=begin

Input: Number
Output: Number

Explicit Req's
Return a number that is 2 times the inpiut unless the input is a double number
Return anu double number as is
Doube number is a number with even number of digits whose left half exactly equals its right half

Implicit Reqs
Negative numbers?
0?
Validate for number input?
Floats?

Determine if number is a double number
  - IF not, return the input number * 2
  - IF so, return the input number

=end

def twice(number)
  is_double_number?(number) ? number : number * 2
end

def is_double_number?(number)
  number.to_s[0, number.to_s.length / 2] == number.to_s[number.to_s.length / 2..-1]
end


puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10