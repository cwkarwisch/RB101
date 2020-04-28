=begin
Problem
---------
Input: array and a search value
Output: boolean

Explicit Req's:
- return true if search value in array



Implicit Req's:
-
return false if we are given an empty array
Validate for non-array input as the first argument?
Assume the search value can be of any type and the array may contain any kind of type

Iterate through the input array
If we encounter an element in the input array that matches the search value, return true
Else return false

Algorithm
---------
ITERATE through the input array
  - return true if the element being iterated over is equal to the search value
RETURN false if no match was found

=end

def include?(array, search_value)
  array.each { |elem| return true if elem == search_value}
  false
end

puts include?([1,2,3,4,5], 3) == true
puts include?([1,2,3,4,5], 6) == false
puts include?([], 3) == false
puts include?([nil], nil) == true
puts include?([], nil) == false