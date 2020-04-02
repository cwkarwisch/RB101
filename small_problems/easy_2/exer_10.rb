# What will the following code print, and why? Don't run the code until you 
# have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# Moe
# Larry
# Curly
# Shemp
# Harpo
# Chico
# Groucho
# Zeppo

# On line 6, each string in the array is shoveled into array2, which at that 
# point makes the two arrays have identical contents, but they are separate
# arrays stored in separate places in memory, with separate strings making
# up the elements of each array.  

# When certain values in array1 are mutated on line 7, that has no affect on
# array 2, which contains its own copies of those strings.

# UPDATE: Got this wrong. When the names are shoveled into array2, references
# to those string objects are being shoveled into the array, not simply copies
# of those strings. Thus, when the objects are mutated, the changes show up
# in array2 as well.   