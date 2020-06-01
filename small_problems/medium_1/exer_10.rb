=begin

calculate nth digit of the sequence
Use modular arithmetic to obtain last digit

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

def fibonacci_last(n)
  acc1 = 1
  acc2 = 1
  (n - 2).times do
    acc1, acc2 = acc2, ((acc1 + acc2) % 10)
  end
  acc2
end

puts fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
puts fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
puts fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
puts fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
puts fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
puts fibonacci_last(123456789) # -> 4