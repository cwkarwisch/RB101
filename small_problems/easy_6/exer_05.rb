def reverse2(array)
  reversed_array = []
  reversed_array.replace(array)
  left_index = 0
  right_index = reversed_array.length - 1
  while left_index < reversed_array.length / 2
    reversed_array[left_index], reversed_array[right_index] = reversed_array[right_index], reversed_array[left_index]
    left_index += 1
    right_index -= 1
  end
  reversed_array
end

def reverse(array)
  array.inject([]) {|reversed_array, element| reversed_array.unshift(element)}
end

puts "tests"
puts "---------"

puts reverse([1,2,3,4]) == [4,3,2,1]          # => true
puts reverse(%w(a b e d c)) == %w(c d e b a)  # => true
puts reverse(['abc']) == ['abc']              # => true
puts reverse([]) == []                        # => true

puts
list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
puts list.object_id != new_list.object_id  # => true
puts list == [1, 3, 2]                     # => true
puts new_list == [2, 3, 1]                 # => true
