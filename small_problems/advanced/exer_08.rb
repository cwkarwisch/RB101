=begin

Input: array
Output: array

Explicit Reqs
Sort array in place or return a new one?
All elements either numbers or strings


Algorithm
Break down elements into nested sub-arrays
  - For a 4 element array, this is a 2 step process
    - We start with 1 array, then an array with two nested sub-arrays,
      then an array with two nested sub-arrays, each with two nested sub-arrays
  - Continue breaking down into nested sub-arrays until each element is in its own nested sub-array

Merge sub-arrays
  - find the innermost two elements, compare them, and put them in order into an array
    - Find elements:


=end


def merge_sorted_arrays(arr1, arr2)
  sorted_arr = []
  array1 = arr1.clone
  array2 = arr2.clone
  while array1.length > 0 && array2.length > 0
    if array1[0] <= array2[0]
      sorted_arr << array1.shift
    else
      sorted_arr << array2.shift
    end
  end
  sorted_arr = sorted_arr + array1 if array2.length == 0
  sorted_arr = sorted_arr + array2 if array1.length == 0
  sorted_arr
end

def split_into_two_arrays(array)
  if array.length.odd?
    mid_point = array.length / 2
  else
    mid_point = (array.length / 2) - 1
  end
  [array.slice!(0..mid_point), array]
end

def merge_sort(arr)
  return [] if arr.length == 0
  return arr.clone if arr.length == 1
  arr1, arr2 = split_into_two_arrays(arr)
  merge_sorted_arrays(merge_sort(arr1), merge_sort(arr2))
end

# p merge_sort([9, 5, 7, 1])

puts merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
puts merge_sort([5, 3]) == [3, 5]
puts merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
puts merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
puts merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
