=begin

Input: Integer
Output: Integer

Explicit Requirements
Return the nth digit of the fibonacci sequence

Implicit Reqs
Validate for positive integer as the input?

=end

def fibonacci(n, fib_hash)
  return fib_hash[n] if fib_hash.has_key?(n)
  if n <= 2
    fib_hash[n] = 1
  else
    fib_hash[n] = fibonacci(n-1, fib_hash) + fibonacci(n-2, fib_hash)
  end
  fib_hash[n]
end

fib_hash = {}

# puts fibonacci(1) == 1
# puts fibonacci(2) == 1
# puts fibonacci(3) == 2
# puts fibonacci(4) == 3
# puts fibonacci(5) == 5
# puts fibonacci(12) == 144
# puts fibonacci(20) == 6765

puts fibonacci(300, fib_hash)