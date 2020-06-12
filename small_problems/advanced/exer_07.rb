

def merge(arr1, arr2)
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



puts merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
puts merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
puts merge([], [1, 4, 5]) == [1, 4, 5]
puts merge([1, 4, 5], []) == [1, 4, 5]
