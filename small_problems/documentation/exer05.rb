a = %w(a b c d e) # ['a', 'b', 'c', 'c', 'e']

puts a.fetch(7) # IndexError, because we are trying to access an element that is out of bounds.

puts a.fetch(7, 'beats me') # 'beats me'. The IndexError is prevented because a default argument
# was provided.  

puts a.fetch(7) { |index| index**2 } # 49. The block only runs if an out-of-bounds index is
# passed as the argument. That invalid index is then passed into the block. 

# %w creates an array of strings. As with the other percent strings, a capital letter allows
# interpolation and escaping characters, while a lowercase letter disables those. 

