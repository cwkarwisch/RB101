=begin

Input: array
Output: the same array

Explicit Requirements
Sort from left to right
Assume at least 2 element array

Implicit Requirements
Assume array will contain objects of the same type that are comparable?
Validate for that?
Validate for array input?

Algorithm

Pseudocode

Starting index = 0
number_of_swaps = 0

2 loops
first loop iterates from starting index until starting index == length - 2
  - Iterate through the array starting at the starting index
    - track current index - initialize at starting index
    - track number of swaps - set to 0
    - compare element at current index with next element
      if next element is less than than current element, swap them
        - incrememnt number of swaps
      else, move to next element
    - increment the current index
    - break when current index == length of array - 2

  - break if number of swaps == 0
  - increment the starting index by 1

return same array
=end

def bubble_sort!(array)
  starting_index = 0
  number_of_swaps = 0

  loop do
    current_index = starting_index
    number_of_swaps = 0
    loop do
      if (array[current_index] <=> array[current_index + 1]) == 1
        array[current_index], array[current_index + 1] = array[current_index + 1], array[current_index]
        number_of_swaps += 1
      end
      current_index += 1
      break if current_index == array.length
    end
    break if number_of_swaps == 0
  end

  array
end


array = [5, 3]
bubble_sort!(array)
puts array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
puts array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
puts array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
