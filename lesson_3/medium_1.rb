# QUESTION 1

(0..9).each { |i| puts " " * i + "The Flintsones Rock!"}

# QUESTION 2

# puts "the value of 40 + 2 is " + (40 + 2)

# This will raise an error because the code is trying to concatenate a string and a number
# We can fix this using string interpolcation or converting the number to a string

puts "the value of 40 + 2 is " + "#{40 + 2}"

puts "the value of 40 + 2 is " + (40 + 2).to_s

# QUESTION 3

def factors(number)
  divisor = number
  factors = []
  if number < 1
    puts "Valid input must be a positive number."
  else
    loop do
      factors << number / divisor if number % divisor == 0
      divisor -= 1
      break if divisor == 0
    end
  end
  factors
end

p factors(10)
p factors(0)

# Bonus 1 - number % divisor == 0 tests whether number is divisble by divisor with no remainder
  # i.e., whether divisor is a factor of number

# Bonus 2 - the second to last line of the method causes the method to return the array of factors

# QUESTION 4

def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# These methods are different because they accept different parameters and mutate those parameters in different ways.
# Implementation 1 takes as an argument the buffer, adds the new element, and deletes the oldest element in the buffer if
# the max buffer size is exceeded once the new element is added. The buffer is actually modified in this implementation and the
# method returns the now modified buffer.

# The second implementation does not modify the paramter passed in as the "input_array", but instead returns the modified buffer,
# without destructively modifying what was passed in as the first argument.

# QUESTION 5

limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

# the problem was the limit not being passed in as an argument, or not being a constant.
# method definitions have a self contained variable scope, and local variables delcared outside the method
# definition are not accessible within the method definition.

# QUESTION 6

answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8 # Reassignment causes a variable to point to a new location in memory
# Because some_number is reassigned within the method definition, some_number ends up
# pointing to a different location in memory than the object being pointed to by the
# variable 'answer'.

# Accordingly, when we print answer -8, the code will print 34

# QUESTION 7

# No - the family's data was not ransacked.
# Within the method, the values in the hash are iterated through using the Hash#each method, which
# does not destructively modify the hash on which the method is called. Although there are assignments within
# the block being passed to the each method, those assignments cause those values to point to new locations in memory,
# and do not destructively modify the values of the original hash passed in as an argument.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)

p munsters

# The data was ransacked. Even though Hash#each does not mutate the caller, the indexed assignments within
# the method do destructively modify the hash.

# QUESTION 8

def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock") # paper


# QUESTION 9

def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

p bar(foo) # "no"