
## SOLUTION THAT STORES VALUES IN A HASH AS WE GO ##

fib_hash = {}

def fibonacci(n, hash)
  if hash.has_key?(n)
    return hash[n]
  elsif n <= 2
    hash[n] = 1
    return 1
  else
    acc1 = fibonacci(n - 1, hash)
    hash[n - 1] = acc1
    acc1 + fibonacci(n - 2, hash)
  end
end

# puts fibonacci(1, fib_hash) == 1
# puts fibonacci(2, fib_hash) == 1
# puts fibonacci(3, fib_hash) == 2
# puts fibonacci(4, fib_hash) == 3
# puts fibonacci(5, fib_hash) == 5
# puts fibonacci(12, fib_hash) == 144
# puts fibonacci(20, fib_hash) == 6765
# puts fibonacci(200, fib_hash)

# p fib_hash


## TAIL RECURSION SOLUTION ##

def fibonacci_tail(n, acc1, acc2)
  if n == 1
    acc1
  elsif n == 2
    acc2
  else
    fibonacci_tail(n - 1, acc2, acc1 + acc2)
  end
end

def fibonacci(n)
  fibonacci_tail(n, 1, 1)
end

# puts fibonacci_tail(1, 1, 1) == 1
# puts fibonacci_tail(2, 1, 1) == 1
# puts fibonacci_tail(3, 1, 1) == 2
# puts fibonacci_tail(4, 1, 1) == 3
# puts fibonacci_tail(5, 1, 1) == 5
# puts fibonacci_tail(6, 1, 1) == 8

puts fibonacci(1) == 1
puts fibonacci(2) == 1
puts fibonacci(3) == 2
puts fibonacci(4) == 3
puts fibonacci(5) == 5
puts fibonacci(12) == 144
puts fibonacci(20) == 6765
puts fibonacci(200)

=begin

We use two accumulators to keep track of the last two numbers in the sequence
We start by supplying the base case of the first two numbers
As n grows, we iterate from n down to 2, going down one level of recursion each time
On each step down into the recursive call, we update acc1 and acc2 to the next 2 numbers in the sequence
We stop when we reach n of 2 in the recursive call, where we return acc2, which will be the nth digit
  in the sequence

fibonacci_tail(4, 1, 1)
  on line 7, we call fibonacci_tail(3, 1, 2)
    within the first level of recursion, on line 7 we call fibonacci_tail(2, 2, 3)
      within the second level of recursion, on line 5 we return 3 to the outer level
    back in the first level of recursion, we are at the last evaluted expression, and 3 is returned
  3 is returned

fibonacci_tail(5, 1, 1)
  on line 7, we call fibonacci_tail(4, 1, 2)
    on line 7, we call fibonacci_tail(3, 2, 3)
      on line 7, we call fibonacci_tail(2, 3, 5)
        on line 5, we return 5


=end
