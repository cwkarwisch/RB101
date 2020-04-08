=begin

Understand the Problem
------------

Input: number
Output: number

Find all multiples of 3 and 5 between 1 and input.
Then sum all of those multiples and return that value. 

Will need to deal with numbers that are both multiples of 3 and 5. 
Based on example, don't double count.

The input number is inclusive, so count as a multiple the input if it is
divisible by 3 or 5. Shown in example. 

Examples/Test Cases
------------
Can assume number is an int > 1.
Handle non-number inputs?

Data Structres
------------
In: number
Out: number

Need to store multiples somehow
Could store multiples of 3 in one array
and store multiples of 5 in another array
then combine them and delete duplicate entries
then calculate the sum of all numbers in the array

Algorithm
------------
SET empty array for multiples of 3
SET empty array for multiples of 5
COMBINE arrays
DELETE duplicate entries in the combined array
SUM the entries in the combined array
RETURN the sum


Simpler-----
SET empty array for all multiples
ITERATE through the range between 1 and the input (inclusive)
  - IF the num % 3 or num % 5 == 0, add it to the array
CALCULATE the sum of the elements in the array
RETURN the sum

=end


def multisum(ceiling)
  multiples_of_3_or_5 = []
  for num in 1..ceiling
    multiples_of_3_or_5 << num if num % 3 == 0 || num % 5 == 0
  end
  multiples_of_3_or_5.reduce(:+) 
end 

puts "tests"
puts "------------"

puts multisum(3) == 3
puts multisum(5) == 8
puts multisum(10) == 33
puts multisum(1000) == 234168
