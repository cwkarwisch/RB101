# QUESTION 1
# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# 1
# 2
# 2
# 3

# Array$uniq is not a destructive method, so the numbers array will be unchanged.

# QUESTION 2
=begin

Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

! generally notes a method that mutates the caller. Methods without a ! may also mutate the caller.
A method ending in ? indicates that the method should return a boolean.

what is != and where should you use it?
  - != is a comparison operator that means is not equal to
  - It should be used when we want to know if two operands are not equal to each other.
put ! before something, like !user_name
  - ! is the bang operator and it inverts the value of whatever follows. It is like using the word 'not'
  - above, is username has a value other than false or nil, user_name will have a truthy value and
  - !user_name will evaluate to false
put ! after something, like words.uniq!
  - words.uniq! calls the uniq method on the object words, and returns a mutated copy of the words object
  - always check the documentation to understand whether a method is destructive and what it returns
put ? before something
  - part of a ternary operator (if/else statement)
-put ? after something
  - if places after an expression that evaluates to true or false, begins the ternary operator
  - if placed after a method name indicates a method that returns a bool
put !! before something, like !!user_name
  - the double bang operator converts a value to a boolean
  - if user_name has a truthy value, !! will convert it to the boolean value true
  - if user_name has a falsy value, it will become false

=end


# QUESTION 3

# Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."
advice.sub!("important", 'urgent')
puts advice

# QUESTION 4

# The Ruby Array class has several methods for removing items from the array.
# Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

# What do the following method calls do (assume we reset numbers to the original array between method calls)?

numbers.delete_at(1) # deletes the element at index[1] : [1, 3, 4, 5] ; returns the deleted element
numbers.delete(1) # deletes the value 1 from the array [2, 3, 4, 5] ; deletes all items equal to the supplied argument; returns the
# last deleted item

# QUESTION 5

# Programmatically determine if 42 lies between 10 and 100.

puts (10..100).include?(42)

# QUESTION 6

famous_words = "seven years ago..."
puts famous_words.prepend("Four score and ")

famous_words2 = "seven years ago..."
puts famous_words2 = "Four score and " + famous_words2

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

flintstones.flatten!

p flintstones

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
p flintstones = flintstones.assoc("Barney")
