=begin

Input: Integer
Output: Array

Explicit Reqs
Return a new array
Starts with 1 and proceeds up to and including the provided argument

Create an array, add 1 as the first element, and continue adding additional
integers increasing by 1 until we add an element that equals the input

SET array

Iterate between 1 and the provided argument
  - On each iteration, add the integer to the end of the array
  - Stop when the integer being added is equal to the provided argument

RETURN array

=end

def sequence2(number)
  array = []
  counter = 1
  loop do
    array << counter
    break if counter == number
    counter += 1
  end
  array
end

def sequence(number)
  array = []
  (1..number).each do |num|
    array << num
  end
  array
end


puts sequence(5) == [1, 2, 3, 4, 5]
puts sequence(3) == [1, 2, 3]
puts sequence(1) == [1]