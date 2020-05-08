=begin

Input: Number
Output: Number

Explicit Reqs
If the input it positive, return negative number
If zero or negative, return inpit

Implciit Reqs
Floats?
Validate for numbers?




=end

def negative(number)
  number < 1 ? number : number * -1
end

puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0