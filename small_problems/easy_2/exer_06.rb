=begin

Print all odd numbers from 1 to 99, inclusive. All numbers should be printed on separate lines.


Understand the Problem
-------------
Use puts to make sure we print on separate lines
Will need to iterate through some DS that contains the numbers between 1 through 99

Examples/Test Cases
-------------
print
1
3
5
7
...
99

Data Structures
-------------
generate the list of numbers by using a for in loop

Algorithm
-------------
for each number in the ranrge between 1 and 99
  IF num is odd (use modular arithmetic)
    - print the number

=end


for num in 1..99
  if num % 2 != 0
    puts num
  end
end 


for num in 1..99
  if num.odd?
    puts num
  end
end


1.upto(99) { |num| puts num if num.odd?}
