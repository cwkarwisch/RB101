=begin

Inout: Array (of arrays)
Output: Single array of strings

Explicit Reqs
Nested arrays in input will contain a fruit and a quantity

Implicit Req's
Return new array object?
What if no quantity listed? Quantity 0?
Validate for input types?

Algorithm
Create new, empty array
Iterate through the sub_arrays in the input array
  - On each iteration, look at the quantity (second value in the sub array)
  - Quantity number of times, add in the fruit to the new array
Return the new array

=end

def buy_fruit(nested_array)
  fruits = []
  nested_array.each do |sub_arr|
    sub_arr[1].times do
      fruits << sub_arr[0]
    end
  end
  fruits
end

puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
