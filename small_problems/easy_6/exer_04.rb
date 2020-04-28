=begin

Understand the Problem
--------
In: array
Out: same array

Reverse elements in place

Use memoization to store the value being switched
Could also use that ruby syntax that swaps two things at once and doesn't need to store the items in
a separate variable
The syntax I'm looking for is called parallel assignment
x, y = y, x

So we would want
array[0], array[length - 1] = array[length - 1], array[0]
when we irterate, need a counter to keep track of where we are
counter = 0
array[counter], array[length - (1 + counter)] = array[length - (1 + counter)], array[counter]
loop while counter < array.length/2

We will actually be mutating the original array because we are doing indexed assignment

Examples/Test Cases
--------
Empty array returns empty array
Validate for array input?

Data Structures
--------
arrays

Algorithm
--------
SET counter = 0
WHILE counter < array.length/2
  array[counter], array[length - (1 + counter)] = array[length - (1 + counter)], array[counter]
  increment counter
RETURN array
=end

def reverse!(array)
  counter = 0
  while counter < array.length / 2
    array[counter], array[array.length - (1 + counter)] = array[array.length - (1 + counter)], array[counter]
    counter += 1
  end
  array
end

puts "tests"
puts "--------"

list = [1,2,3,4]
result = reverse!(list)
puts result == [4, 3, 2, 1]
puts list == [4, 3, 2, 1]
puts list.object_id == result.object_id

puts
list = %w(a b e d c)
puts reverse!(list) == ["c", "d", "e", "b", "a"]
puts list == ["c", "d", "e", "b", "a"]

puts
list = ['abc']
puts reverse!(list) == ["abc"]
puts list == ["abc"]

puts
list = []
puts reverse!(list) == []
puts list == []