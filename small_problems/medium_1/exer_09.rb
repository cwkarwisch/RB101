=begin

Input: integer
Output: integer

Algorithm

Start with 1 and 1
Continue adding new numbers to the sequence by adding the two previous numbers
If n is 3, we will add 1 number to the sequence
If n is 4, we'll add 2 numbers to the sequence

acc1 acc2

def fibonacci
  SET acc1 to 1
  SET acc2 to 1
  Start a loop that will run n - 2 times
    Calculate sum of last two digits
    Set acc2 equal to the sum
    Set acc1 equal to the previous value of acc2
Return acc2

=end

def fibonacci(n)
  return 1 if n <= 2
  acc1 = 1
  acc2 = 1
  (n - 2).times do
    acc1, acc2 = acc2, (acc1 + acc2)
  end
  acc2
end


puts fibonacci(3) == 2
puts fibonacci(50)
# puts fibonacci(100) == 354224848179261915075
# puts fibonacci(100_001) # => 4202692702.....8285979669707537501