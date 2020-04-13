=begin

Understand the Problem
-----------
Input: String
Output: numeric

ignore positive or minus
no need to validate inputs

cannot use built in methods

Easy to go character by character and say if '1' then 1
But we also need to account for positioning
Need to know the length of the string. 
Since we are only working with ints, length will tell us when we are dealing
with thousands, with hundreds, tens, etc. 


Examples/Test Cases
-----------
'570' - length = 3
as we iterate through the string, if we start at the end, we always know 
we are going up by multiples of 10. So 1, 10s, 100s, 1000s, 10000s, etc.
Can use a loop to iterate through with a counter keeping track of which 
level we are at and stopping when we've iterated through a number of times 
equal to the length of the string.

Empty string?

Data Structures
-----------
In: string
Out: numeric

Will use program's logic to get the string to numbers, but shouldn't need
other DSs

Algorithm
-----------
write simple method that converts each string char to the appr number

SET counter = the length of the string
SET MULTIPLE = 1
SET number = 0

WHILE counter > 0
  - SET num_char to return value of calling str_char_to_number with 
    string[counter - 1] as the argument
  - SET number = number + (num_char * multiple)
  - multiple = multiple * 10
  - decrement the counter by 1

RETURN number

=end

def str_char_to_number(str_char)
  case str_char
  when '0' then 0
  when '1' then 1
  when '2' then 2
  when '3' then 3
  when '4' then 4
  when '5' then 5
  when '6' then 6
  when '7' then 7
  when '8' then 8
  when '9' then 9
  else puts "that's not a valid string character"
  end
end  

def string_to_integer(str)
  counter = str.length
  multiple = 1
  number = 0

  while counter > 0
    num_of_char = str_char_to_number(str[counter - 1])
    number += (num_of_char * multiple)
    multiple *= 10
    counter -= 1
  end
  number
end

puts "tests"
puts "---------"
puts string_to_integer('4321') == 4321
puts string_to_integer('570') == 570
