def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

# This method returns a string that is a different object than the one passed in.
# String#split is not a destructive method, and returns a new array, which we then call
# Enum#each on. Within that new array, we do call the destrucitve method String#reverse!
# on each word, which does modify individual elements of the array. We then join the elements
# of the array into a new string and return that string, which is a different
# object from our input argument.