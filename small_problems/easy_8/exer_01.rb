=begin

Problem
-----
Input: array
Output: number

Explicit Req's:
Returns the sum of the sums of each leading sequence in the array
Array will contain at least one number

Implicit Req's
Array only contains numbers

Start with the first number in the array and add it to our sum
Make a sequence of the first and second number, sum those numbers, add to our cumulative sum
Repeat with a sequence size that is one larger until we reach the end of the nubers in the array

Algorithm
-----
SET cumulative sum to 0
ITERATE through array
  - Starting


=end

def sum_of_sums2(array)
  cumulative_sum = 0
  counter = 0
  until counter == array.size
    (0..counter).to_a.each {|idx| cumulative_sum += array[idx] }
    counter += 1
  end
  cumulative_sum
end

def sum_of_sums(numbers)
  cumulative_sum = 0
  sum = 0
  for number in numbers
    sum += number
    cumulative_sum += sum
  end
  cumulative_sum
end


puts sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
puts sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
puts sum_of_sums([4]) == 4
puts sum_of_sums([1, 2, 3, 4, 5]) == 35