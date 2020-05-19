=begin

Input: Array
Output: a new array

Explicit Req;s
Move first element to end of array and shift all other elements forward
Don't modify original array

Impliit Req's
Empty array return empty array?
Validate for array input?
Array with single element will return an identical array

Take the first element of the array
Add it to the end of thr array
Remove the now empty first element of the array

Return the array

=end

def rotate_array(original_array)
  rotated_arr = original_array.clone
  elem_to_rotate = rotated_arr[0]
  rotated_arr.push(elem_to_rotate)
  rotated_arr.shift
  rotated_arr
end

puts rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
puts rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
puts rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
puts rotate_array(x) == [2, 3, 4, 1]   # => true
puts x == [1, 2, 3, 4]
