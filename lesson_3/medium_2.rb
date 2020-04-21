# QUESTION 1

=begin
def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block." # 42 # 85
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block." # "forty two" # 70327288018840
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block." #[42] # 70327288030000
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block." # 42 # 85
  puts

  1.times do
    a_outer_inner_id = a_outer.object_id
    b_outer_inner_id = b_outer.object_id
    c_outer_inner_id = c_outer.object_id
    d_outer_inner_id = d_outer.object_id

    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block." # 85 # 85
    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block." # 70327288018840 # 70327288018840
    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block." # 70327288030000 # 70327288030000
    puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer_inner_id} inside the block." # 85 # 85
    puts

    a_outer = 22
    b_outer = "thirty three"
    c_outer = [44]
    d_outer = c_outer[0]

    puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after." # 22 # 85 # 45
    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after." # "thirty three" # 70327288018840 # 70327271210460
    puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after." # [44] # 70327288030000 # 70327271203540
    puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after." #44 # 85 # 89
    puts


    a_inner = a_outer
    b_inner = b_outer
    c_inner = c_outer
    d_inner = c_inner[0]

    a_inner_id = a_inner.object_id
    b_inner_id = b_inner.object_id
    c_inner_id = c_inner.object_id
    d_inner_id = d_inner.object_id

    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)." # 22 # 45 # 45
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)." # "thirty three" # 70327271210460 # 70327271210460
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)." # [44] # 70327271203540 # 70327271203540
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer)." #44 # 89 # 89
    puts
  end

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block." # 22 # 85 # 45
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block." # "thirty three" # 70327288018840 # 70327271210460
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block." # [44] # 70327288030000 # 70327271203540
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block." #44 # 85 # 89
  puts

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh" # ugh ohhhhh # ugh ohhhhh # ugh ohhhhh
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh" # ugh ohhhhh # ugh ohhhhh # ugh ohhhhh
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh" # ugh ohhhhh # ugh ohhhhh # ugh ohhhhh
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh" # ugh ohhhhh # ugh ohhhhh # ugh ohhhhh
end

fun_with_ids
=end

# QUESTION 2

def fun_with_ids
  a_outer = 42
  b_outer = "forty two"
  c_outer = [42]
  d_outer = c_outer[0]

  a_outer_id = a_outer.object_id
  b_outer_id = b_outer.object_id
  c_outer_id = c_outer.object_id
  d_outer_id = d_outer.object_id

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block." # 42 # 85
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block." # "forty two" # 70327288018840
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block." #[42] # 70327288030000
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block." # 42 # 85
  puts

  an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)


  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the method call." #42 #85 # 85 # variable was not reassigned because of shadowing in the method
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the method call." #forty two # same ids
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the method call." # [42] # same ids
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the method call." #42 #85 #85
  puts

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh" # ugh ohhhhh
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh" # ugh ohhhhh
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh" # ugh ohhhhh
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh" # ugh ohhhhh
  puts
end


def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)

  puts "a_outer id was #{a_outer_id} before the method and is: #{a_outer.object_id} inside the method." # 85 # 85
  puts "b_outer id was #{b_outer_id} before the method and is: #{b_outer.object_id} inside the method." # same
  puts "c_outer id was #{c_outer_id} before the method and is: #{c_outer.object_id} inside the method." # same
  puts "d_outer id was #{d_outer_id} before the method and is: #{d_outer.object_id} inside the method." # same
  puts

  a_outer = 22
  b_outer = "thirty three"
  c_outer = [44]
  d_outer = c_outer[0]

  puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after." #22 #85 #45
  puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after." #thirty three #old object id # new object id
  puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after." # [44] #old object id # new object id
  puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after." # 44 #old object id # new object id
  puts

  a_inner = a_outer
  b_inner = b_outer
  c_inner = c_outer
  d_inner = c_inner[0]

  a_inner_id = a_inner.object_id
  b_inner_id = b_inner.object_id
  c_inner_id = c_inner.object_id
  d_inner_id = d_inner.object_id

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the method (compared to #{a_outer.object_id} for outer)." #22 #45 #45
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the method (compared to #{b_outer.object_id} for outer)." #thirty three # same ids
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the method (compared to #{c_outer.object_id} for outer)." # [44] # same ids
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the method (compared to #{d_outer.object_id} for outer)." # 44 # same ids
  puts
end

fun_with_ids

# QUESTION 3

def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}" # pumpkins # Assignment causes a variable to point to a new location in memory
# and does not modify the original object. This is not the case, however, for indexed assignment, setter methods
# or concatenation.
puts "My array looks like this now: #{my_array}" # ["pumpkins", "rutabage"] # concatenation does destructively modify self

# QUESTION 4

def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}" # "pumpkinsrutabage"
puts "My array looks like this now: #{my_array}" # ["pumpkins"]

# QUESTION 5

def add_rutabaga!(param)
  param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
add_rutabaga!(my_string)
add_rutabaga!(my_array)

puts "My string looks like this now: #{my_string}" # pumpkinsrutabaga
puts "My array looks like this now: #{my_array}" #["pumpkins", "rutabaga"]

# we renamed the method to be clear about what it does: it adds rutabaga to the argument passed in
# we also added an ! at the end of the method name to indicate to the user that this method destructively modifies the argument
# we also simplified the method to only modify one object at a time.

# QUESTION 6

def color_valid(color)
  color == "blue" || color == "green"
end

puts color_valid("blue")
puts color_valid("green")
puts color_valid("red")
