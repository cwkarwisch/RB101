s = 'abc'
# puts s.public_methods.inspect

# prints all public methods available to this string, including those that string inherits from
# its parent classes (Object, Basic Object, and Kernel).

# To just print the public methods defined or overridden by String itself, set the default value
# of all to false when calling Object#public_methods. 
# The syntax is public_methods(all=true) → array

puts s.public_methods(all = false).inspect