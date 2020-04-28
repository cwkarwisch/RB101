# QUESTION 1

if false
  greeting = “hello world”
end

greeting

# expect an error to be raised because greeting is undefined because the block within the if statement will never execute

# UPDATE: no exception is raised. This happens because when the local variable greeting is initialized in the if block,
# even though the code within the block is never executed, the local variable is still initialized to nil.

# QUESTION 2

greetings = { a: 'hi' }
informal_greeting = greetings[:a]
informal_greeting << ' there'

puts informal_greeting  #  => "hi there"
puts greetings # => { a: "hi there"}

# the local variable informal_greeting and the value associated with the key :a in the greetings hash both
# point to the same string object.

# When we destructively modify that string object with concatenation, the change shows up in the hash as well since the
# string object being pointed to has been modified.

# QUESTION 3

def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # one
puts "two is: #{two}" # two
puts "three is: #{three}" # three

# all that happens within the method is assignment, which creates a new local variable to be pointed to, rather than
# modifying the object on which the method assignment was called. Further, the outer variables are shadowed by the inner
# ones since they have the same names.

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # one
puts "two is: #{two}" # two
puts "three is: #{three}" # three

# the answer here is the same, and for the same reasons as the above.
# Only assignment is occurring, plus the outer variables are shadowed.

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # two
puts "two is: #{two}" # three
puts "three is: #{three}" # one

# Here the outer variables are actually changed.
# When we pass in, for example the outer variable one, the method assigns the value of one, which a string object "one",
# to a new local variable also named one. Both variables named one, the inner and the outer, point to the same string
# object, "one".

# When String#gsub! is called on the inner variable one, the gsub! method destructively modifies the string object
# being pointed to by both variables. Since the object itself is modified, the change shows up after and outside of
# the method call.

# QUESTION 4

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.length == 4
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  return true
end
