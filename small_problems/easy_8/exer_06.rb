=begin

Problem
--------

Input: Two numbers
Output: Print out of numbers

Explicit Req's
Pint out all numbers between the two input numbers
Except
  - If a number is divisible by 3, print fizz
  - If a number is divisble by 5, print buzz
  - If a number is divisible by 3 and 5, print fizzbuzz

Implicit Req's
Only accept ints? What if we're given floats?
All numbers means all integers?
What if second number lower than first number? Handle either case?
Include each of the input numbers in our range

Print out every number in the given range, checking each time whether the number is divisble by 3 and 5

Algorithm
---------

CHECK whether second number is greater than second number
  - IF so, the range is between the first input and the second input
  - IF not, the range is between the second input and the first input

SET range

ITERATE through the range
  - At each iteration, check if divisible by three and five
    - If so, print fixxbuzz
  - If divisible by 3, print fizz
  - If divisible by 5, print buzz
  - Else, print the number

=end

def fizzbuzz(num1, num2)
  if num1 < num2
    range = (num1..num2)
  else
    range = (num2..num1)
  end

  range.each do |num|
    if num % 3 == 0 && num % 5 == 0
      print "FizzBuzz"
    elsif num % 3 == 0
      print "Fizz"
    elsif num % 5 == 0
      print "Buzz"
    else
      print "#{num}"
    end
    print ", " unless num == range.last
    puts "" if num == range.last
  end
end

fizzbuzz(1, 15)