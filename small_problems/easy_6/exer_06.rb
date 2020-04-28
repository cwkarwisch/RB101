=begin

Understand the Problem
-------------
In: two arrays
Out: one array

create empty merged array
replace empty array with the first array
then iterate through the second array, adding the elements in
call uniq! on the merged array
return the merged array

Examples/Test Cases
-------------
Validate for array input?

Data Structures
-------------
arrays

Algorithm
-------------

=end

def merge(arr1, arr2)
  merged_array = []
  merged_array.replace(arr1)
  arr2.each{|elem| merged_array << elem}
  merged_array.uniq!
end

puts "test"

puts merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]