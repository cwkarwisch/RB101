=begin

Understand the Problem
--------
Input - an array
Output - an array that contains every other element of the input array

We start counting from index 0 based on the examples

Seems like a good use case for Array#select
Determine which elements to keep based on whether their index position is even
  - keep the even ones: e.g. element 0, elem 2, elem 4, etc....
  - but to work need to know exactly which index we are at when we pass
    value into select
May be easier to use Enumerable#each_with_index and shovel the values into the new
arr when we are on the even indices  

Examples/Test Cases
--------
oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []

Empty array shoudl return an empty array
Validate for non-array inputs?

Data Structures
--------
In: Array
Out: Array

Should be no need to convert to intermediate DSs

Algorithm
--------
START

SET every_other_array equal to an empty array

ITERATE through the original array
  - if the index value is even, shovel value into the new array
  - else, move to next element

RETURN every_other_array

END

=end

def oddities(array)
  every_other_array = []
  array.each_with_index {|elem, idx| every_other_array << elem if idx % 2 == 0}
  every_other_array
end 


def oddities2(array)
  every_other_array = []
  array.each_index {|idx| every_other_array << array[idx] if idx.even? == true}
  every_other_array
end 

def oddities3(array)
  every_other_array = []
  idx = 0
  while idx < array.length
    every_other_array << array[idx] if idx.even? == true
    idx += 2
  end  
  every_other_array
end 


puts "tests"
puts "----------"
puts oddities3([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities3([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
puts oddities3(['abc', 'def']) == ['abc']
puts oddities3([123]) == [123]
puts oddities3([]) == []

