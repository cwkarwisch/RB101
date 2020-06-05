=begin

Input: integer
Output: integer

Expliciut Reqs
Feauted number is
  - multiple of 7
  - odd
  - no digit occurs more than once
Return next hightest featured number above input
Error message if no possible value
  - happens when it is not possible to have unique digits, so definitely nothing more than 10 digits
  - nothing more than 9,999,999,999
  - if negative input though, ok to have more than 10 digits

Implicit Reqs
Validate for numeric input?
Negaitve numbers?

Algorithm

If no possible featured number, issue error message

Take the input number and start counting up by 1
  - At each number, ask if the number is
    - odd? (should be able to skip over even numbers entirely)
    - a multiple of 7?
    - unique digits?
  If any of those are false, break and and move to the next digit
  If all true, return number

=end

def featured(num)
  if num.positive? && num >= 9_999_999_999
    return puts "There is no possible number that fulfills those requirements"
  end
  loop do
    num += 1
    break if featured_number?(num)
    return puts "There is no possible number that fulfills those requirements" if num >= 9_999_999_999
  end
  num
end

def featured_number?(number)
  if number.positive?
    number.odd? && number % 7 == 0 && number.digits == number.digits.uniq
  else
    number.odd? && number % 7 == 0 && (number * -1).digits == (number * -1).digits.uniq
  end
end

puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
puts featured(999_999) == 1_023_547
puts featured(999_999_987) == 1_023_456_987
puts featured(-12) == -7



puts featured(9_999_999_999)
# puts featured(9012346875)
