
=begin

Input: two integers
Output: array

Explicit Reqs
First integer is a count
Second integer is the starting value of the sequence
Additional values in the sequence are multiples of the starting value
Count of 0 should return an empty list

Implicit Reqs
Vlidate for non-integer input?
Won't recieve a negative count

Algorithm

Create empty array
Start a loop that will iterate X times based on the count
  - Add the starting value to the array
  - On each subsequent iteration, add the appropriate multiple of the starting value to the array
Return the array

=end

def sequence(count, starting_value)
  sequence_arr = []
  multiple = 1
  count.times do
    sequence_arr << (starting_value * multiple)
    multiple += 1
  end
  sequence_arr
end

puts sequence(5, 1) == [1, 2, 3, 4, 5]
puts sequence(4, -7) == [-7, -14, -21, -28]
puts sequence(3, 0) == [0, 0, 0]
puts sequence(0, 1000000) == []
